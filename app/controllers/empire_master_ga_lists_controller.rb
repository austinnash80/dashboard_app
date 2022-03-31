class EmpireMasterGaListsController < ApplicationController
  before_action :set_empire_master_ga_list, only: %i[ show edit update destroy ]

  # GET /empire_master_ga_lists or /empire_master_ga_lists.json
  def index
    @empire_master_ga_lists = EmpireMasterGaList.all
    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterGaList.delete_all
      EmpireState.where(st: 'GA').update_all list_size: 0
      EmpireMasterGaMatch.delete_all
      EmpireState.where(st: 'GA').update_all matched_customers: 0
      redirect_to empire_master_ga_lists_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_ga_lists.to_csv, filename: "Empire_Master_GA_List-#{Date.today}.csv" }
    end
  end

  # GET /empire_master_ga_lists/1 or /empire_master_ga_lists/1.json
  def show
  end

  # GET /empire_master_ga_lists/new
  def new
    @empire_master_ga_list = EmpireMasterGaList.new
  end

  # GET /empire_master_ga_lists/1/edit
  def edit
  end

  # POST /empire_master_ga_lists or /empire_master_ga_lists.json
  def create
    @empire_master_ga_list = EmpireMasterGaList.new(empire_master_ga_list_params)

    respond_to do |format|
      if @empire_master_ga_list.save
        format.html { redirect_to @empire_master_ga_list, notice: "Empire master ga list was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_ga_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_ga_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_ga_lists/1 or /empire_master_ga_lists/1.json
  def update
    respond_to do |format|
      if @empire_master_ga_list.update(empire_master_ga_list_params)
        format.html { redirect_to @empire_master_ga_list, notice: "Empire master ga list was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_ga_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_ga_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_ga_lists/1 or /empire_master_ga_lists/1.json
  def destroy
    @empire_master_ga_list.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_ga_lists_url, notice: "Empire master ga list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterGaList.my_import(params[:file])
    list = EmpireMasterGaList.first(1).pluck(:list)
      y = list.join[2,4]
      m = list.join[6,2]
      d = list.join[8,2]
    EmpireState.where(st: 'GA').update_all list_size: EmpireMasterGaList.count, list_date: y+'-'+m+"-"+d
    redirect_to empire_master_ga_lists_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_ga_list
      @empire_master_ga_list = EmpireMasterGaList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_ga_list_params
      params.require(:empire_master_ga_list).permit(:lid, :list, :lic_state, :lic, :record_type, :lic_status, :iss_date_s, :iss_date, :exp_date_s, :exp_date, :fname, :mi, :lname, :suf, :co, :add, :add2, :city, :st, :zip, :email, :phone)
    end
end
