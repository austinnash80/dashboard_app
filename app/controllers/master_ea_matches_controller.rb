class MasterEaMatchesController < ApplicationController
  before_action :set_master_ea_match, only: %i[ show edit update destroy ]

  # GET /master_ea_matches or /master_ea_matches.json
  def index
    @master_ea_matches = MasterEaMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MasterEaMatch.delete_all
      redirect_to master_ea_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @master_ea_matches.to_csv, filename: "Sequoia-Master-EA-Match-#{Date.today}.csv" }
    end
  end

  # GET /master_ea_matches/1 or /master_ea_matches/1.json
  def show
  end

  # GET /master_ea_matches/new
  def new
    @master_ea_match = MasterEaMatch.new
  end

  # GET /master_ea_matches/1/edit
  def edit
  end

  # POST /master_ea_matches or /master_ea_matches.json
  def create
    @master_ea_match = MasterEaMatch.new(master_ea_match_params)

    respond_to do |format|
      if @master_ea_match.save
        format.html { redirect_to @master_ea_match, notice: "Master ea match was successfully created." }
        format.json { render :show, status: :created, location: @master_ea_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_ea_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_ea_matches/1 or /master_ea_matches/1.json
  def update
    respond_to do |format|
      if @master_ea_match.update(master_ea_match_params)
        format.html { redirect_to @master_ea_match, notice: "Master ea match was successfully updated." }
        format.json { render :show, status: :ok, location: @master_ea_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_ea_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_ea_matches/1 or /master_ea_matches/1.json
  def destroy
    @master_ea_match.destroy
    respond_to do |format|
      format.html { redirect_to master_ea_matches_url, notice: "Master ea match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MasterEaMatch.my_import(params[:file])
    redirect_to master_ea_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_ea_match
      @master_ea_match = MasterEaMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_ea_match_params
      params.require(:master_ea_match).permit(:lid, :list, :uid, :lname, :search_date)
    end
end
