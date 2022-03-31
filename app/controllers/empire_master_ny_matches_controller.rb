class EmpireMasterNyMatchesController < ApplicationController
  before_action :set_empire_master_ny_match, only: %i[ show edit update destroy ]

  # GET /empire_master_ny_matches or /empire_master_ny_matches.json
  def index
    @empire_master_ny_matches = EmpireMasterNyMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterNyMatch.delete_all
      EmpireState.where(st: 'NY').update_all matched_customers: 0
      redirect_to empire_master_ny_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_ny_matches.to_csv, filename: "Empire_Master_NY_Matches-#{Date.today}.csv" }
    end

    if params['run'] == 'yes'
      run
    end
  end

  def run
    member = EmpireMember.where(state: "NY").pluck(:lic_num)
    master = EmpireMasterNyList.pluck(:lic)
    matched = EmpireMasterNyMatch.pluck(:lic)
    new = (master - matched) & member
    list = EmpireMasterNyList.first(1).pluck(:list)[0]

    if params['type'] == 'large'
      EmpireMasterNyList.select("id","lid","lic", "exp_date", "lname").where(lic: new).find_in_batches(batch_size: 500).each do |masters|
        masters.each do |master|
          uid = EmpireMember.find_by(lic_num: master.lic)
          EmpireMasterNyMatch.create(
            st: "NY",
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
        EmpireMasterNyMatch.create(
          lic: i,
          st: 'NY',
          list: list,
          search_date: Time.now
        ).save
      end
      EmpireMasterNyMatch.where(uid: nil).each do |i|
        empire_member = EmpireMember.where(state: 'NY').find_by(lic_num: i.lic)
        master_list = EmpireMasterNyList.find_by(lic: i.lic)
        EmpireMasterNyMatch.where(id: i.id).update_all lid: master_list.lid, exp: master_list.exp_date, lname: master_list.lname, uid: empire_member.uid
      end
    end

    expired = EmpireMember.where(state: 'NY').where(lic_expired: true).count
    other = EmpireMember.where(state: 'NY').where(lic_not_found: true).count + EmpireMember.where(state: 'NY').where(lic_not_in_master: true).count
    total = EmpireMember.where(state: 'NY').count
    matched = EmpireMasterNyMatch.count
    EmpireState.where(st: 'NY').update_all customers: total, matched_customers: matched, lic_expired: expired, lic_other: other

    redirect_to list_data_hp_empire_states_path(), notice: "NY Update Done"
  end

  # GET /empire_master_ny_matches/1 or /empire_master_ny_matches/1.json
  def show
  end

  # GET /empire_master_ny_matches/new
  def new
    @empire_master_ny_match = EmpireMasterNyMatch.new
  end

  # GET /empire_master_ny_matches/1/edit
  def edit
  end

  # POST /empire_master_ny_matches or /empire_master_ny_matches.json
  def create
    @empire_master_ny_match = EmpireMasterNyMatch.new(empire_master_ny_match_params)

    respond_to do |format|
      if @empire_master_ny_match.save
        format.html { redirect_to @empire_master_ny_match, notice: "Empire master ny match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_ny_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_ny_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_ny_matches/1 or /empire_master_ny_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_ny_match.update(empire_master_ny_match_params)
        format.html { redirect_to @empire_master_ny_match, notice: "Empire master ny match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_ny_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_ny_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_ny_matches/1 or /empire_master_ny_matches/1.json
  def destroy
    @empire_master_ny_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_ny_matches_url, notice: "Empire master ny match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterNyMatch.my_import(params[:file])
    redirect_to empire_master_ny_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_ny_match
      @empire_master_ny_match = EmpireMasterNyMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_ny_match_params
      params.require(:empire_master_ny_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
