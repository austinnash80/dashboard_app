class EmpireMasterMnMatchesController < ApplicationController
  before_action :set_empire_master_mn_match, only: %i[ show edit update destroy ]

  # GET /empire_master_mn_matches or /empire_master_mn_matches.json
  def index
    @empire_master_mn_matches = EmpireMasterMnMatch.all
  end

  # GET /empire_master_mn_matches/1 or /empire_master_mn_matches/1.json
  def show
  end

  # GET /empire_master_mn_matches/new
  def new
    @empire_master_mn_match = EmpireMasterMnMatch.new
  end

  # GET /empire_master_mn_matches/1/edit
  def edit
  end

  # POST /empire_master_mn_matches or /empire_master_mn_matches.json
  def create
    @empire_master_mn_match = EmpireMasterMnMatch.new(empire_master_mn_match_params)

    respond_to do |format|
      if @empire_master_mn_match.save
        format.html { redirect_to @empire_master_mn_match, notice: "Empire master mn match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_mn_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_mn_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_mn_matches/1 or /empire_master_mn_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_mn_match.update(empire_master_mn_match_params)
        format.html { redirect_to @empire_master_mn_match, notice: "Empire master mn match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_mn_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_mn_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_mn_matches/1 or /empire_master_mn_matches/1.json
  def destroy
    @empire_master_mn_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_mn_matches_url, notice: "Empire master mn match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_mn_match
      @empire_master_mn_match = EmpireMasterMnMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_mn_match_params
      params.require(:empire_master_mn_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
