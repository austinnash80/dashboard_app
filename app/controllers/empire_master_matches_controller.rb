class EmpireMasterMatchesController < ApplicationController
  before_action :set_empire_master_match, only: %i[ show edit update destroy ]

  # GET /empire_master_matches or /empire_master_matches.json
  def index
    @empire_master_matches = EmpireMasterMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterMatch.delete_all
      redirect_to empire_master_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_matches.to_csv, filename: "Empire-Master-Match-#{Date.today}.csv" }
    end

    # run update
    if params['run'].present? && params['run'] == 'NY'
      ny_already_matched_uid = EmpireMasterMatch.where(lic_st: 'NY').pluck(:uid)
      ny_master = EmpireMasterNyList.pluck(:lic, :lname)
      ny_customer = EmpireMember.where.not(uid: ny_already_matched_uid).where(state: 'NY').pluck(:lic_num, :lname)
      ny_match = (ny_customer & ny_master)
      ny_lic = [].uniq

      ny_match.each do |a,b|
        ny_lic.push(a)
      end

      EmpireMember.where(state: 'NY').where(lic_num: ny_lic).each do |i|
        master = EmpireMasterNyList.find_by(lic: i.lic_num)
        EmpireMasterMatch.create(
          lid: master.lid,
          list: master.list,
          exp: master.exp_date,
          lic_st: master.lic_state,
          lic: master.lic,
          uid: i.uid,
          lname: master.lname,
          search_date: Time.now,
        ).save
      end

      redirect_to empire_states_path(), notice: "NY Matches Updated"
    end

  end

  def matching
    states = ['CA', 'NY']
    @match_table = EmpireMasterMatch.pluck(:uid)
    @match_table_lid = EmpireMasterMatch.pluck(:lid)
    @no_match_table = EmpireMasterNoMatch.pluck(:uid)
    @double_account_table = EmpireMasterDoubleAccount.pluck(:uid)
    @number_storage = IdNumberStorage.pluck(:empire_auto_match_id)[0]

    if params['auto_match'] == 'yes' #RUN AUTO MATCH
      EmpireMember.where('id > ?', @number_storage).where.not(uid: @match_table).where.not(uid: @no_match_table).where(state: states).order(created_at: :ASC).each do |i|
        i.state == 'CA' ? table = EmpireMasterCaList : i.state == 'NY' ? table = EmpireMasterNyList : ''
        # i.state == 'CA' ? list = EmpireMasterCaList.last(1).pluck(:list)[0] : i.state == 'NY' ? list = EmpireMasterNyList.last(1).pluck(:list)[0] : ''
        empire = EmpireCustomer.find_by(uid: i.uid)
          if empire.lname.present? && empire.lic_num.present?
            lid = table.where('upper(lic) = ?', empire.lic_num.upcase).where('upper(lname) = ?', empire.lname.upcase).pluck(:lid)[0]
            master = table.find_by(lid: lid)
            unless lid.blank?
              EmpireMasterMatch.create(lid: master.lid, uid: empire.uid, list: master.list, exp: master.exp_date, lic_st: master.lic_state, lname: empire.lname, search_date: Date.today).save
            end
          end
      end
      uid = EmpireMasterMatch.order(created_at: :DESC).first(1).pluck(:uid)[0]
      id = EmpireMember.find_by(uid: uid)
      IdNumberStorage.update_all empire_auto_match_id: id.id
      redirect_to matching_empire_master_matches_path(), notice: 'Auto Match Complete'
    end #END AUTO MATCH

    if params['no_match'] == 'yes' #NO MATCH
      empire = EmpireMember.find_by(uid: params['uid'])
      empire.state == 'CA' ? list = EmpireMasterCaList.last(1).pluck(:list)[0] : empire.state == 'NY' ? list = EmpireMasterNyList.last(1).pluck(:list)[0] : ''
      EmpireMasterNoMatch.create(uid: empire.uid, list: list, lic_st: empire.state, lname: empire.lname, search_date: Date.today).save
      redirect_to matching_empire_master_matches_path(), notice: 'No Match Added'
    end #END NO MATCH

    if params['match'] == 'yes' #MATCH
      empire = EmpireMember.find_by(uid: params['uid'])
      empire.state == 'CA' ? table = EmpireMasterCaList : empire.state == 'NY' ? table = EmpireMasterNyList : ''
      master = table.find_by(lid: params['lid'])
      EmpireMasterMatch.create(lid: master.lid, uid: empire.uid, list: master.list, lic_st: empire.state, lname: empire.lname, exp: master.exp_date, search_date: Date.today).save
      redirect_to matching_empire_master_matches_path(), notice: 'Match Added'
    end #END MATCH

    if params['double_account'] == 'yes' #Double Account
      empire = EmpireMember.find_by(uid: params['uid'])
      empire.state == 'CA' ? list = EmpireMasterCaList.last(1).pluck(:list)[0] : empire.state == 'NY' ? list = EmpireMasterNyList.last(1).pluck(:list)[0] : ''
      EmpireMasterDoubleAccount.create(uid: params['uid'], list: list, lic_st: empire.state, lname: empire.lname, search_date: Date.today).save
      redirect_to matching_empire_master_matches_path(), notice: 'Double Account Added'
    end # END Double Account

  end

  # GET /empire_master_matches/1 or /empire_master_matches/1.json
  def show
  end

  # GET /empire_master_matches/new
  def new
    @empire_master_match = EmpireMasterMatch.new
  end

  # GET /empire_master_matches/1/edit
  def edit
  end

  # POST /empire_master_matches or /empire_master_matches.json
  def create
    @empire_master_match = EmpireMasterMatch.new(empire_master_match_params)

    respond_to do |format|
      if @empire_master_match.save
        format.html { redirect_to @empire_master_match, notice: "Empire master match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_matches/1 or /empire_master_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_match.update(empire_master_match_params)
        format.html { redirect_to @empire_master_match, notice: "Empire master match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_matches/1 or /empire_master_matches/1.json
  def destroy
    @empire_master_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_matches_url, notice: "Empire master match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterMatch.my_import(params[:file])
    redirect_to empire_master_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_match
      @empire_master_match = EmpireMasterMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_match_params
      params.require(:empire_master_match).permit(:lid, :list, :lic_st, :uid, :search_date, :lname, :exp)
    end
end
