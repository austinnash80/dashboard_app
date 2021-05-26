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
  end

  def matching
    @match_table = EmpireMasterMatch.pluck(:uid)
    @no_match_table = EmpireMasterNoMatch.pluck(:uid)
    @number_storage = IdNumberStorage.pluck(:empire_auto_match_id)[0]

    if params['auto_match'] == 'yes' #RUN AUTO MATCH
      EmpireMember.where('id > ?', @number_storage).where.not(uid: @match_table).where.not(uid: @no_match_table).where(state: 'NY').order(created_at: :ASC).each do |i|
        empire = EmpireCustomer.find_by(uid: i.uid)
          if empire.lic_state == 'NY' && empire.lname.present? && empire.lic_num.present?
            list = EmpireMasterNyList.last(1).pluck(:list)[0]
            lid = EmpireMasterNyList.where('upper(lic) = ?', empire.lic_num.upcase).where('upper(lname) = ?', empire.lname.upcase).pluck(:lid)[0]
            EmpireMasterMatch.create(lid: lid, uid: empire.uid, list: list, lic_st: empire.state, lname: empire.lname, search_date: Date.today).save
          end
        IdNumberStorage.update_all empire_auto_match_id: i.id
        @match_table = EmpireMasterMatch.pluck(:uid)
        @no_match_table = EmpireMasterNoMatch.pluck(:uid)
      end
      redirect_to matching_empire_master_matches_path(), notice: 'Auto Match Complete'
    end #END AUTO MATCH

    if params['no_match'] == 'yes' #MATCH
      empire = EmpireMember.find_by(uid: params['uid'])
      if empire.state == 'NY'
        list = EmpireMasterNyList.last(1).pluck(:list)[0]
      end
      EmpireMasterNoMatch.create(uid: empire.uid, list: list, lic_st: empire.state, lname: empire.lname, search_date: Date.today).save
      redirect_to matching_empire_master_matches_path(), notice: 'No Match Added'
    end
    if params['match'] == 'yes' #NO MATCH
      empire = EmpireMember.find_by(uid: params['uid'])
      if empire.state == 'NY'
        list = EmpireMasterNyList.last(1).pluck(:list)[0]
      end
      EmpireMasterMatch.create(lid: params['lid'], uid: empire.uid, list: list, lic_st: empire.state, lname: empire.lname, search_date: Date.today).save
      redirect_to matching_empire_master_matches_path(), notice: 'Match Added'
    end

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
      params.require(:empire_master_match).permit(:lid, :list, :lic_st, :uid, :search_date, :lname)
    end
end
