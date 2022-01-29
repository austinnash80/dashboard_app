class EmpireMasterUtMatchesController < ApplicationController
  before_action :set_empire_master_ut_match, only: %i[ show edit update destroy ]

  # GET /empire_master_ut_matches or /empire_master_ut_matches.json
  def index
    @empire_master_ut_matches = EmpireMasterUtMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterUtMatch.delete_all
      redirect_to empire_master_ut_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_ut_matches.to_csv, filename: "Empire_Master_UT_Matches-#{Date.today}.csv" }
    end

    if params['run'] == 'yes'
      run
    end
  end

  # GET /empire_master_ut_matches/1 or /empire_master_ut_matches/1.json
  def show
  end

  # GET /empire_master_ut_matches/new
  def new
    @empire_master_ut_match = EmpireMasterUtMatch.new
  end

  # GET /empire_master_ut_matches/1/edit
  def edit
  end

  # POST /empire_master_ut_matches or /empire_master_ut_matches.json
  def create
    @empire_master_ut_match = EmpireMasterUtMatch.new(empire_master_ut_match_params)

    respond_to do |format|
      if @empire_master_ut_match.save
        format.html { redirect_to @empire_master_ut_match, notice: "Empire master ut match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_ut_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_ut_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_ut_matches/1 or /empire_master_ut_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_ut_match.update(empire_master_ut_match_params)
        format.html { redirect_to @empire_master_ut_match, notice: "Empire master ut match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_ut_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_ut_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_ut_matches/1 or /empire_master_ut_matches/1.json
  def destroy
    @empire_master_ut_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_ut_matches_url, notice: "Empire master ut match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterUtMatch.my_import(params[:file])
    redirect_to empire_master_ut_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_ut_match
      @empire_master_ut_match = EmpireMasterUtMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_ut_match_params
      params.require(:empire_master_ut_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
