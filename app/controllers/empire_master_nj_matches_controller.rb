class EmpireMasterNjMatchesController < ApplicationController
  before_action :set_empire_master_nj_match, only: %i[ show edit update destroy ]

  # GET /empire_master_nj_matches or /empire_master_nj_matches.json
  def index
    @empire_master_nj_matches = EmpireMasterNjMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterNjMatch.delete_all
      EmpireState.where(st: 'NJ').update_all matched_customers: 0
      redirect_to empire_master_nj_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_nj_matches.to_csv, filename: "Empire_Master_NJ_Matches-#{Date.today}.csv" }
    end

    if params['run'] == 'yes'
      run
    end
  end

  def run

    lic_fix_member

    already_matched_uid = EmpireMasterNjMatch.pluck(:uid)
    master = EmpireMasterNjList.pluck(:lic, :lname)
    customer = EmpireMember.where.not(uid: already_matched_uid).where(state: 'NJ').pluck(:lic_num, :lname)
    match = (customer & master)
    lic = [].uniq

    match.each do |a,b|
      lic.push(a)
    end

    EmpireMember.where(state: 'NJ').where(lic_num: lic).each do |i|
      master = EmpireMasterNjList.find_by(lic: i.lic_num)
      if master.present?
        EmpireMasterNjMatch.create(
          st: "NJ",
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

    total = EmpireMember.where(state: 'NJ').count
    matched = EmpireMasterNjMatch.count
    EmpireState.where(st: 'NJ').update_all customers: total, matched_customers: matched

    redirect_to list_data_hp_empire_states_path(), notice: "NJ Update Done"
    # redirect_to empire_master_nj_matches_path(), notice: "Update Done"
  end

  def lic_fix_member

    EmpireMember.where(state: 'NJ').all.each do |i|
      if i.lic_num.present? && i.lic_num.length != 7
        if i.lic_num.length == 1
          EmpireMember.where(id: i.id).update_all lic_num: '000000' + i.lic_num
        elsif i.lic_num.length == 2
          EmpireMember.where(id: i.id).update_all lic_num: '00000' + i.lic_num
        elsif i.lic_num.length == 3
          EmpireMember.where(id: i.id).update_all lic_num: '0000' + i.lic_num
        elsif i.lic_num.length == 4
          EmpireMember.where(id: i.id).update_all lic_num: '000' + i.lic_num
        elsif i.lic_num.length == 5
          EmpireMember.where(id: i.id).update_all lic_num: '00' + i.lic_num
        elsif i.lic_num.length == 6
          EmpireMember.where(id: i.id).update_all lic_num: '0' + i.lic_num
        end
      end
    end

  end

  # GET /empire_master_nj_matches/1 or /empire_master_nj_matches/1.json
  def show
  end

  # GET /empire_master_nj_matches/new
  def new
    @empire_master_nj_match = EmpireMasterNjMatch.new
  end

  # GET /empire_master_nj_matches/1/edit
  def edit
  end

  # POST /empire_master_nj_matches or /empire_master_nj_matches.json
  def create
    @empire_master_nj_match = EmpireMasterNjMatch.new(empire_master_nj_match_params)

    respond_to do |format|
      if @empire_master_nj_match.save
        format.html { redirect_to @empire_master_nj_match, notice: "Empire master nj match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_nj_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_nj_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_nj_matches/1 or /empire_master_nj_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_nj_match.update(empire_master_nj_match_params)
        format.html { redirect_to @empire_master_nj_match, notice: "Empire master nj match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_nj_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_nj_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_nj_matches/1 or /empire_master_nj_matches/1.json
  def destroy
    @empire_master_nj_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_nj_matches_url, notice: "Empire master nj match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterNjMatch.my_import(params[:file])
    list = EmpireMasterNjList.first(1).pluck(:list)
      y = list.join[2,4]
      m = list.join[6,2]
      d = list.join[8,2]
    EmpireState.where(st: 'NJ').update_all list_size: EmpireMasterNjList.count, list_date: y+'-'+m+"-"+d
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_nj_match
      @empire_master_nj_match = EmpireMasterNjMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_nj_match_params
      params.require(:empire_master_nj_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
