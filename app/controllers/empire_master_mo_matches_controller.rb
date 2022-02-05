class EmpireMasterMoMatchesController < ApplicationController
  before_action :set_empire_master_mo_match, only: %i[ show edit update destroy ]

  # GET /empire_master_mo_matches or /empire_master_mo_matches.json
  def index
    @empire_master_mo_matches = EmpireMasterMoMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterMoMatch.delete_all
      EmpireState.where(st: 'MO').update_all matched_customers: 0
      redirect_to empire_master_mo_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_mo_matches.to_csv, filename: "Empire_Master_MO_Matches-#{Date.today}.csv" }
    end

    if params['run'] == 'yes'
      run
    end
  end

  def run
    # already_matched_uid = EmpireMasterMoMatch.pluck(:uid)
    # EmpireMember.where(state: 'MO').where.not(uid: already_matched_uid).each do |i|
    #   master = EmpireMasterMoList.find_by(lic: i.lic_num)
    #   if master.present?
    #     EmpireMasterMoMatch.create(
    #       st: "MO",
    #       lid: master.lid,
    #       list: master.list,
    #       exp: master.exp_date,
    #       lic: master.lic,
    #       uid: i.uid,
    #       lname: master.lname,
    #       search_date: Time.now,
    #     ).save
    #   end
    # end

    member = EmpireMember.where(state: "MO").pluck(:lic_num)
    master = EmpireMasterMoList.pluck(:lic)
    matched = EmpireMasterMoMatch.pluck(:lic)
    new = (master - matched) & member

    new.each do |i|
      EmpireMasterMoMatch.create(lic: i).save
    end

    EmpireMasterMoMatch.where(uid: nil).each do |i|
      empire_member = EmpireMember.where(state: 'MO').find_by(lic_num: i.lic)
      master_list = EmpireMasterMoList.find_by(lic: i.lic)
      EmpireMasterMoMatch.where(id: i.id).update_all st: "MO", lid: master_list.lid, list: master_list.list, exp: master_list.exp_date, lname: master_list.lname, uid: empire_member.uid, search_date: Time.now
    end
    #
    # EmpireMasterMoList.select("id","lid","lic", "list", "exp_date", "lname").where(lic: new).each do |master|
    #   EmpireMember.transaction do
    #     EmpireMasterMoMatch.create(
    #       st: "MO",
    #       lid: master.lid,
    #       list: master.list,
    #       exp: master.exp_date,
    #       lic: master.lic,
    #       # uid: i.uid,
    #       lname: master.lname,
    #       search_date: Time.now,
    #     ).save
    #   end
    # end
    #
    # EmpireMasterMoMatch.where(uid: nil).each do |i|
    #   member = EmpireMember.find_by(lic_num: i.lic)
    #   EmpireMasterMoMatch.update_all uid: member.uid
    # end


    # EmpireMember.select("id","uid", "lic_num").where(state: 'MO').find_in_batches(batch_size: 250) do |members|
    #   EmpireMember.transaction do
    #     members.each do |i|
    #       EmpireMasterMoList.select("lid","lic", "list", "exp_date", "lname").where(lic: i.lic_num).each do |master|
    #         EmpireMasterMoMatch.create(
    #           st: "MO",
    #           lid: master.lid,
    #           list: master.list,
    #           exp: master.exp_date,
    #           lic: master.lic,
    #           uid: i.uid,
    #           lname: master.lname,
    #           search_date: Time.now,
    #         ).save
    #       end
    #     end
    #   end
    # end

    total = EmpireMember.where(state: 'MO').count
    matched = EmpireMasterMoMatch.count
    EmpireState.where(st: 'MO').update_all customers: total, matched_customers: matched

    # redirect_to list_data_hp_empire_states_path(), notice: "CA Update Done"
    if params['route'] == 'hp'
      redirect_to list_data_hp_empire_states_path(), notice: "MO Update Done"
    else
      redirect_to empire_master_ind_matches_path(), notice: "Update Done"
    end
  end

  # GET /empire_master_mo_matches/1 or /empire_master_mo_matches/1.json
  def show
  end

  # GET /empire_master_mo_matches/new
  def new
    @empire_master_mo_match = EmpireMasterMoMatch.new
  end

  # GET /empire_master_mo_matches/1/edit
  def edit
  end

  # POST /empire_master_mo_matches or /empire_master_mo_matches.json
  def create
    @empire_master_mo_match = EmpireMasterMoMatch.new(empire_master_mo_match_params)

    respond_to do |format|
      if @empire_master_mo_match.save
        format.html { redirect_to @empire_master_mo_match, notice: "Empire master mo match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_mo_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_mo_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_mo_matches/1 or /empire_master_mo_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_mo_match.update(empire_master_mo_match_params)
        format.html { redirect_to @empire_master_mo_match, notice: "Empire master mo match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_mo_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_mo_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_mo_matches/1 or /empire_master_mo_matches/1.json
  def destroy
    @empire_master_mo_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_mo_matches_url, notice: "Empire master mo match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterMoMatch.my_import(params[:file])
    redirect_to empire_master_mo_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_mo_match
      @empire_master_mo_match = EmpireMasterMoMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_mo_match_params
      params.require(:empire_master_mo_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
