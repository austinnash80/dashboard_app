class EmpireMasterKsMatchesController < ApplicationController
  before_action :set_empire_master_ks_match, only: %i[ show edit update destroy ]

  # GET /empire_master_ks_matches or /empire_master_ks_matches.json
  def index
    @empire_master_ks_matches = EmpireMasterKsMatch.all
  end

  # GET /empire_master_ks_matches/1 or /empire_master_ks_matches/1.json
  def show
  end

  # GET /empire_master_ks_matches/new
  def new
    @empire_master_ks_match = EmpireMasterKsMatch.new
  end

  # GET /empire_master_ks_matches/1/edit
  def edit
  end

  # POST /empire_master_ks_matches or /empire_master_ks_matches.json
  def create
    @empire_master_ks_match = EmpireMasterKsMatch.new(empire_master_ks_match_params)

    respond_to do |format|
      if @empire_master_ks_match.save
        format.html { redirect_to @empire_master_ks_match, notice: "Empire master ks match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_ks_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_ks_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_ks_matches/1 or /empire_master_ks_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_ks_match.update(empire_master_ks_match_params)
        format.html { redirect_to @empire_master_ks_match, notice: "Empire master ks match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_ks_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_ks_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_ks_matches/1 or /empire_master_ks_matches/1.json
  def destroy
    @empire_master_ks_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_ks_matches_url, notice: "Empire master ks match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_ks_match
      @empire_master_ks_match = EmpireMasterKsMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_ks_match_params
      params.require(:empire_master_ks_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
