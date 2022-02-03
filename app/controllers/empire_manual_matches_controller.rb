class EmpireManualMatchesController < ApplicationController
  before_action :set_empire_manual_match, only: %i[ show edit update destroy ]

  # GET /empire_manual_matches or /empire_manual_matches.json
  def index
    @empire_manual_matches = EmpireManualMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireManualMatch.delete_all
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_manual_matches.to_csv, filename: "Empire_Manual_Match-#{Date.today}.csv" }
    end
    if params['match'].present?
      add_new
    end
  end

  def add_new
    if params['match'] == 'yes'
      EmpireManualMatch.create(
        match: true,
        uid: params['uid'],
        lic_state: params['lic_state'],
        lic: params['lic'],
        lid: params['lid'],
        list: params['list'],
        lname: params['lname']
      ).save
    end
    if params['match'] == 'no'
      EmpireManualMatch.create(
        match: false,
        uid: params['uid'],
      ).save
    end

  end

  # GET /empire_manual_matches/1 or /empire_manual_matches/1.json
  def show
  end

  # GET /empire_manual_matches/new
  def new
    @empire_manual_match = EmpireManualMatch.new
  end

  # GET /empire_manual_matches/1/edit
  def edit
  end

  # POST /empire_manual_matches or /empire_manual_matches.json
  def create
    @empire_manual_match = EmpireManualMatch.new(empire_manual_match_params)

    respond_to do |format|
      if @empire_manual_match.save
        format.html { redirect_to @empire_manual_match, notice: "Empire manual match was successfully created." }
        format.json { render :show, status: :created, location: @empire_manual_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_manual_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_manual_matches/1 or /empire_manual_matches/1.json
  def update
    respond_to do |format|
      if @empire_manual_match.update(empire_manual_match_params)
        format.html { redirect_to @empire_manual_match, notice: "Empire manual match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_manual_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_manual_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_manual_matches/1 or /empire_manual_matches/1.json
  def destroy
    @empire_manual_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_manual_matches_url, notice: "Empire manual match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireManualMatch.my_import(params[:file])
    redirect_to empire_manual_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_manual_match
      @empire_manual_match = EmpireManualMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_manual_match_params
      params.require(:empire_manual_match).permit(:match, :uid, :lid, :list, :lic, :lname, :lic_state)
    end
end
