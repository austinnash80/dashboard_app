class EmpireMasterNcMatchesController < ApplicationController
  before_action :set_empire_master_nc_match, only: %i[ show edit update destroy ]

  # GET /empire_master_nc_matches or /empire_master_nc_matches.json
  def index
    @empire_master_nc_matches = EmpireMasterNcMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterNcMatch.delete_all
      EmpireState.where(st: 'NC').update_all matched_customers: 0
      redirect_to empire_master_nc_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_nc_matches.to_csv, filename: "Empire_Master_NC_Matches-#{Date.today}.csv" }
    end

    if params['run'] == 'yes'
      run
    end
  end

  def run
    member = EmpireMember.where(state: "NC").pluck(:lic_num)
    master = EmpireMasterNcList.pluck(:lic)
    matched = EmpireMasterNcMatch.pluck(:lic)
    new = (master - matched) & member
    list = EmpireMasterNcList.first(1).pluck(:list)[0]

    if params['type'] == 'large'
      EmpireMasterNcList.select("id","lid","lic", "exp_date", "lname").where(lic: new).find_in_batches(batch_size: 500).each do |masters|
        masters.each do |master|
          uid = EmpireMember.find_by(lic_num: master.lic)
          EmpireMasterNcMatch.create(
            st: "NC",
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
        EmpireMasterNcMatch.create(
          lic: i,
          st: 'NC',
          list: list,
          search_date: Time.now
        ).save
      end
      EmpireMasterNcMatch.where(uid: nil).each do |i|
        empire_member = EmpireMember.where(state: 'NC').find_by(lic_num: i.lic)
        master_list = EmpireMasterNcList.find_by(lic: i.lic)
        EmpireMasterNcMatch.where(id: i.id).update_all lid: master_list.lid, exp: master_list.exp_date, lname: master_list.lname, uid: empire_member.uid
      end
    end

    expired = EmpireMember.where(state: 'NC').where(lic_expired: true).count
    other = EmpireMember.where(state: 'NC').where(lic_not_found: true).count + EmpireMember.where(state: 'NC').where(lic_not_in_master: true).count
    total = EmpireMember.where(state: 'NC').count
    matched = EmpireMasterNcMatch.count
    EmpireState.where(st: 'NC').update_all customers: total, matched_customers: matched, lic_expired: expired, lic_other: other

    redirect_to list_data_hp_empire_states_path(), notice: "NC Update Done"
  end

  # GET /empire_master_nc_matches/1 or /empire_master_nc_matches/1.json
  def show
  end

  # GET /empire_master_nc_matches/new
  def new
    @empire_master_nc_match = EmpireMasterNcMatch.new
  end

  # GET /empire_master_nc_matches/1/edit
  def edit
  end

  # POST /empire_master_nc_matches or /empire_master_nc_matches.json
  def create
    @empire_master_nc_match = EmpireMasterNcMatch.new(empire_master_nc_match_params)

    respond_to do |format|
      if @empire_master_nc_match.save
        format.html { redirect_to @empire_master_nc_match, notice: "Empire master nc match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_nc_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_nc_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_nc_matches/1 or /empire_master_nc_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_nc_match.update(empire_master_nc_match_params)
        format.html { redirect_to @empire_master_nc_match, notice: "Empire master nc match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_nc_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_nc_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_nc_matches/1 or /empire_master_nc_matches/1.json
  def destroy
    @empire_master_nc_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_nc_matches_url, notice: "Empire master nc match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterNcMatch.my_import(params[:file])
    redirect_to empire_master_nc_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_nc_match
      @empire_master_nc_match = EmpireMasterNcMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_nc_match_params
      params.require(:empire_master_nc_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
