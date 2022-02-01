class EmpireMasterNoMatchesController < ApplicationController
  before_action :set_empire_master_no_match, only: %i[ show edit update destroy ]

  # GET /empire_master_no_matches or /empire_master_no_matches.json
  def index
    @empire_master_no_matches = EmpireMasterNoMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterNoMatch.delete_all
      EmpireState.where(st: 'MO').update_all list_size: 0
      redirect_to empire_master_no_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_no_matches.to_csv, filename: "Empire-Master-No-Match-#{Date.today}.csv" }
    end

  end

  # GET /empire_master_no_matches/1 or /empire_master_no_matches/1.json
  def show
  end

  # GET /empire_master_no_matches/new
  def new
    @empire_master_no_match = EmpireMasterNoMatch.new
  end

  # GET /empire_master_no_matches/1/edit
  def edit
  end

  # POST /empire_master_no_matches or /empire_master_no_matches.json
  def create
    @empire_master_no_match = EmpireMasterNoMatch.new(empire_master_no_match_params)

    respond_to do |format|
      if @empire_master_no_match.save
        format.html { redirect_to @empire_master_no_match, notice: "Empire master no match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_no_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_no_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_no_matches/1 or /empire_master_no_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_no_match.update(empire_master_no_match_params)
        format.html { redirect_to @empire_master_no_match, notice: "Empire master no match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_no_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_no_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_no_matches/1 or /empire_master_no_matches/1.json
  def destroy
    @empire_master_no_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_no_matches_url, notice: "Empire master no match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterNoMatch.my_import(params[:file])
    redirect_to empire_master_no_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_no_match
      @empire_master_no_match = EmpireMasterNoMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_no_match_params
      params.require(:empire_master_no_match).permit(:uid, :list, :lic_st, :search_date, :lname)
    end
end
