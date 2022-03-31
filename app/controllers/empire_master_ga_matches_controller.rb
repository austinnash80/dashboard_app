class EmpireMasterGaMatchesController < ApplicationController
  before_action :set_empire_master_ga_match, only: %i[ show edit update destroy ]

  # GET /empire_master_ga_matches or /empire_master_ga_matches.json
  def index
    @empire_master_ga_matches = EmpireMasterGaMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterGaMatch.delete_all
      EmpireState.where(st: 'GA').update_all matched_customers: 0
      redirect_to empire_master_ga_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_ga_matches.to_csv, filename: "Empire_Master_GA_Matches-#{Date.today}.csv" }
    end

    if params['run'] == 'yes'
      run
    end
  end

  def run
    member = EmpireMember.where(state: "GA").pluck(:lic_num)
    master = EmpireMasterGaList.pluck(:lic)
    matched = EmpireMasterGaMatch.pluck(:lic)
    new = (master - matched) & member
    list = EmpireMasterGaList.first(1).pluck(:list)[0]

    if params['type'] == 'large'
      EmpireMasterGaList.select("id","lid","lic", "exp_date", "lname").where(lic: new).find_in_batches(batch_size: 500).each do |masters|
        masters.each do |master|
          uid = EmpireMember.find_by(lic_num: master.lic)
          EmpireMasterGaMatch.create(
            st: "GA",
            lid: master.lid,
            list: list,
            exp: master.exp_date,
            lic: master.lic,
            uid: uid.uid,
            lname: master.lname,
            search_date: Time.now,
          ).save
        end
      end
    elsif params['type'] == 'small'
      new.each do |i|
        EmpireMasterGaMatch.create(
          lic: i,
          st: 'GA',
          list: list,
          search_date: Time.now
        ).save
      end
      EmpireMasterGaMatch.where(uid: nil).each do |i|
        empire_member = EmpireMember.where(state: 'GA').find_by(lic_num: i.lic)
        master_list = EmpireMasterGaList.find_by(lic: i.lic)
        EmpireMasterGaMatch.where(id: i.id).update_all lid: master_list.lid, exp: master_list.exp_date, lname: master_list.lname, uid: empire_member.uid
      end
    end

    expired = EmpireMember.where(state: 'GA').where(lic_expired: true).count
    other = EmpireMember.where(state: 'GA').where(lic_not_found: true).count + EmpireMember.where(state: 'GA').where(lic_not_in_master: true).count
    total = EmpireMember.where(state: 'GA').count
    matched = EmpireMasterGaMatch.count
    EmpireState.where(st: 'GA').update_all customers: total, matched_customers: matched, lic_expired: expired, lic_other: other

    redirect_to list_data_hp_empire_states_path(), notice: "GA Update Done"
  end

  # GET /empire_master_ga_matches/1 or /empire_master_ga_matches/1.json
  def show
  end

  # GET /empire_master_ga_matches/new
  def new
    @empire_master_ga_match = EmpireMasterGaMatch.new
  end

  # GET /empire_master_ga_matches/1/edit
  def edit
  end

  # POST /empire_master_ga_matches or /empire_master_ga_matches.json
  def create
    @empire_master_ga_match = EmpireMasterGaMatch.new(empire_master_ga_match_params)

    respond_to do |format|
      if @empire_master_ga_match.save
        format.html { redirect_to @empire_master_ga_match, notice: "Empire master ga match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_ga_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_ga_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_ga_matches/1 or /empire_master_ga_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_ga_match.update(empire_master_ga_match_params)
        format.html { redirect_to @empire_master_ga_match, notice: "Empire master ga match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_ga_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_ga_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_ga_matches/1 or /empire_master_ga_matches/1.json
  def destroy
    @empire_master_ga_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_ga_matches_url, notice: "Empire master ga match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterGaMatch.my_import(params[:file])
    redirect_to empire_master_ga_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_ga_match
      @empire_master_ga_match = EmpireMasterGaMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_ga_match_params
      params.require(:empire_master_ga_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
