class MasterCpaNoMatchesController < ApplicationController
  before_action :set_master_cpa_no_match, only: %i[ show edit update destroy ]

  # GET /master_cpa_no_matches or /master_cpa_no_matches.json
  def index
    @master_cpa_no_matches = MasterCpaNoMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MasterCpaNoMatch.delete_all
      redirect_to master_cpa_no_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @master_cpa_no_matches.to_csv, filename: "Sequoia-Master-CPA-No-Match-#{Date.today}.csv" }
    end
  end

  # GET /master_cpa_no_matches/1 or /master_cpa_no_matches/1.json
  def show
  end

  # GET /master_cpa_no_matches/new
  def new
    @master_cpa_no_match = MasterCpaNoMatch.new
  end

  # GET /master_cpa_no_matches/1/edit
  def edit
  end

  # POST /master_cpa_no_matches or /master_cpa_no_matches.json
  def create
    @master_cpa_no_match = MasterCpaNoMatch.new(master_cpa_no_match_params)

    respond_to do |format|
      if @master_cpa_no_match.save
        format.html { redirect_to @master_cpa_no_match, notice: "Master cpa no match was successfully created." }
        format.json { render :show, status: :created, location: @master_cpa_no_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_cpa_no_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_cpa_no_matches/1 or /master_cpa_no_matches/1.json
  def update
    respond_to do |format|
      if @master_cpa_no_match.update(master_cpa_no_match_params)
        format.html { redirect_to @master_cpa_no_match, notice: "Master cpa no match was successfully updated." }
        format.json { render :show, status: :ok, location: @master_cpa_no_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_cpa_no_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_cpa_no_matches/1 or /master_cpa_no_matches/1.json
  def destroy
    @master_cpa_no_match.destroy
    respond_to do |format|
      format.html { redirect_to master_cpa_no_matches_url, notice: "Master cpa no match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MasterCpaNoMatch.my_import(params[:file])
    redirect_to master_cpa_no_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_cpa_no_match
      @master_cpa_no_match = MasterCpaNoMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_cpa_no_match_params
      params.require(:master_cpa_no_match).permit(:uid, :list, :lname, :search_date)
    end
end
