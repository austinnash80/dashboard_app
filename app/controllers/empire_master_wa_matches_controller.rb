class EmpireMasterWaMatchesController < ApplicationController
  before_action :set_empire_master_wa_match, only: %i[ show edit update destroy ]

  # GET /empire_master_wa_matches or /empire_master_wa_matches.json
  def index
    @empire_master_wa_matches = EmpireMasterWaMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterWaMatch.delete_all
      EmpireState.where(st: 'WA').update_all matched_customers: 0
      redirect_to empire_master_wa_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_wa_matches.to_csv, filename: "Empire_Master_WA_Matches-#{Date.today}.csv" }
    end

    if params['run'] == 'yes'
      run
    end
  end

  def run
    member = EmpireMember.where(state: "WA").pluck(:lic_num)
    master = EmpireMasterWaList.pluck(:lic)
    matched = EmpireMasterWaMatch.pluck(:lic)
    new = (master - matched) & member
    list = EmpireMasterWaList.first(1).pluck(:list)[0]

    if params['type'] == 'large'
      EmpireMasterWaList.select("id","lid","lic", "exp_date", "lname").where(lic: new).find_in_batches(batch_size: 500).each do |masters|
        masters.each do |master|
          uid = EmpireMember.find_by(lic_num: master.lic)
          EmpireMasterWaMatch.create(
            st: "WA",
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
        EmpireMasterWaMatch.create(
          lic: i,
          st: 'WA',
          list: list,
          search_date: Time.now
        ).save
      end
      EmpireMasterWaMatch.where(uid: nil).each do |i|
        empire_member = EmpireMember.where(state: 'WA').find_by(lic_num: i.lic)
        master_list = EmpireMasterWaList.find_by(lic: i.lic)
        EmpireMasterWaMatch.where(id: i.id).update_all lid: master_list.lid, exp: master_list.exp_date, lname: master_list.lname, uid: empire_member.uid
      end
    end

    expired = EmpireMember.where(state: 'WA').where(lic_expired: true).count
    other = EmpireMember.where(state: 'WA').where(lic_not_found: true).count + EmpireMember.where(state: 'WA').where(lic_not_in_master: true).count
    total = EmpireMember.where(state: 'WA').count
    matched = EmpireMasterWaMatch.count
    EmpireState.where(st: 'WA').update_all customers: total, matched_customers: matched, lic_expired: expired, lic_other: other

    redirect_to list_data_hp_empire_states_path(), notice: "WA Update Done"
  end

  # GET /empire_master_wa_matches/1 or /empire_master_wa_matches/1.json
  def show
  end

  # GET /empire_master_wa_matches/new
  def new
    @empire_master_wa_match = EmpireMasterWaMatch.new
  end

  # GET /empire_master_wa_matches/1/edit
  def edit
  end

  # POST /empire_master_wa_matches or /empire_master_wa_matches.json
  def create
    @empire_master_wa_match = EmpireMasterWaMatch.new(empire_master_wa_match_params)

    respond_to do |format|
      if @empire_master_wa_match.save
        format.html { redirect_to @empire_master_wa_match, notice: "Empire master wa match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_wa_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_wa_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_wa_matches/1 or /empire_master_wa_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_wa_match.update(empire_master_wa_match_params)
        format.html { redirect_to @empire_master_wa_match, notice: "Empire master wa match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_wa_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_wa_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_wa_matches/1 or /empire_master_wa_matches/1.json
  def destroy
    @empire_master_wa_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_wa_matches_url, notice: "Empire master wa match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterWaMatch.my_import(params[:file])
    redirect_to empire_master_wa_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_wa_match
      @empire_master_wa_match = EmpireMasterWaMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_wa_match_params
      params.require(:empire_master_wa_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
