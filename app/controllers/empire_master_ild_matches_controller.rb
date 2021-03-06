class EmpireMasterIldMatchesController < ApplicationController
  before_action :set_empire_master_ild_match, only: %i[ show edit update destroy ]

  # GET /empire_master_ild_matches or /empire_master_ild_matches.json
  def index
    @empire_master_ild_matches = EmpireMasterIldMatch.all
  end

  # GET /empire_master_ild_matches/1 or /empire_master_ild_matches/1.json
  def show
  end

  # GET /empire_master_ild_matches/new
  def new
    @empire_master_ild_match = EmpireMasterIldMatch.new
  end

  # GET /empire_master_ild_matches/1/edit
  def edit
  end

  # POST /empire_master_ild_matches or /empire_master_ild_matches.json
  def create
    @empire_master_ild_match = EmpireMasterIldMatch.new(empire_master_ild_match_params)

    respond_to do |format|
      if @empire_master_ild_match.save
        format.html { redirect_to @empire_master_ild_match, notice: "Empire master ild match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_ild_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_ild_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_ild_matches/1 or /empire_master_ild_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_ild_match.update(empire_master_ild_match_params)
        format.html { redirect_to @empire_master_ild_match, notice: "Empire master ild match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_ild_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_ild_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_ild_matches/1 or /empire_master_ild_matches/1.json
  def destroy
    @empire_master_ild_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_ild_matches_url, notice: "Empire master ild match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_ild_match
      @empire_master_ild_match = EmpireMasterIldMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_ild_match_params
      params.require(:empire_master_ild_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
