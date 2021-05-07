class MasterCpasController < ApplicationController
  before_action :set_master_cpa, only: %i[ show edit update destroy ]

  # GET /master_cpas or /master_cpas.json
  def index
    @master_cpas = MasterCpa.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MasterCpa.delete_all
      redirect_to master_cpas_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @master_cpas.to_csv, filename: "Sequoia-Master-CPA-#{Date.today}.csv" }
    end

  end

  # GET /master_cpas/1 or /master_cpas/1.json
  def show
  end

  # GET /master_cpas/new
  def new
    @master_cpa = MasterCpa.new
  end

  # GET /master_cpas/1/edit
  def edit
  end

  # POST /master_cpas or /master_cpas.json
  def create
    @master_cpa = MasterCpa.new(master_cpa_params)

    respond_to do |format|
      if @master_cpa.save
        format.html { redirect_to @master_cpa, notice: "Master cpa was successfully created." }
        format.json { render :show, status: :created, location: @master_cpa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_cpa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_cpas/1 or /master_cpas/1.json
  def update
    respond_to do |format|
      if @master_cpa.update(master_cpa_params)
        format.html { redirect_to @master_cpa, notice: "Master cpa was successfully updated." }
        format.json { render :show, status: :ok, location: @master_cpa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_cpa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_cpas/1 or /master_cpas/1.json
  def destroy
    @master_cpa.destroy
    respond_to do |format|
      format.html { redirect_to master_cpas_url, notice: "Master cpa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MasterCpa.my_import(params[:file])
    redirect_to master_cpas_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_cpa
      @master_cpa = MasterCpa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_cpa_params
      params.require(:master_cpa).permit(:lid, :list, :lic_st, :lic, :fname, :mi, :lname, :suf, :co, :add, :add2, :city, :st, :zip)
    end
end
