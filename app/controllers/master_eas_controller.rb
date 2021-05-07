class MasterEasController < ApplicationController
  before_action :set_master_ea, only: %i[ show edit update destroy ]

  # GET /master_eas or /master_eas.json
  def index
    @master_eas = MasterEa.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MasterEa.delete_all
      redirect_to master_eas_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @master_eas.to_csv, filename: "Sequoia-Master-EA-#{Date.today}.csv" }
    end
  end

  # GET /master_eas/1 or /master_eas/1.json
  def show
  end

  # GET /master_eas/new
  def new
    @master_ea = MasterEa.new
  end

  # GET /master_eas/1/edit
  def edit
  end

  # POST /master_eas or /master_eas.json
  def create
    @master_ea = MasterEa.new(master_ea_params)

    respond_to do |format|
      if @master_ea.save
        format.html { redirect_to @master_ea, notice: "Master ea was successfully created." }
        format.json { render :show, status: :created, location: @master_ea }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_ea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_eas/1 or /master_eas/1.json
  def update
    respond_to do |format|
      if @master_ea.update(master_ea_params)
        format.html { redirect_to @master_ea, notice: "Master ea was successfully updated." }
        format.json { render :show, status: :ok, location: @master_ea }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_ea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_eas/1 or /master_eas/1.json
  def destroy
    @master_ea.destroy
    respond_to do |format|
      format.html { redirect_to master_eas_url, notice: "Master ea was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MasterEa.my_import(params[:file])
    redirect_to master_eas_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_ea
      @master_ea = MasterEa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_ea_params
      params.require(:master_ea).permit(:lid, :list, :lic, :fname, :mi, :lname, :suf, :co, :add, :add2, :city, :st, :zip)
    end
end
