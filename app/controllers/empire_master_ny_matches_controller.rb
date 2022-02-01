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

    # lic_fix_member
    # lic_fix_master

    already_matched_uid = EmpireMasterNyMatch.pluck(:uid)
    master = EmpireMasterNyList.pluck(:lic, :lname)
    customer = EmpireMember.where.not(uid: already_matched_uid).where(state: 'NY').pluck(:lic_num, :lname)
    match = (customer & master)
    lic = [].uniq

    match.each do |a,b|
      lic.push(a)
    end

    EmpireMember.where(state: 'NY').where(lic_num: lic).each do |i|
      master = EmpireMasterNyList.find_by(lic: i.lic_num)
      if master.present?
        EmpireMasterNyMatch.create(
          st: "NY",
          lid: master.lid,
          list: master.list,
          exp: master.exp_date,
          lic: master.lic,
          uid: i.uid,
          lname: master.lname,
          search_date: Time.now,
        ).save
      end
    end

    total = EmpireMember.where(state: 'NY').count
    matched = EmpireMasterNyMatch.count
    EmpireState.where(st: 'NY').update_all customers: total, matched_customers: matched

    redirect_to list_data_hp_empire_states_path(), notice: "NY Update Done"
    # redirect_to empire_master_ny_matches_path(), notice: "Update Done"
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
