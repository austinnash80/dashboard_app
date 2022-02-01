class EmpireMasterNmListsController < ApplicationController
  before_action :set_empire_master_nm_list, only: %i[ show edit update destroy ]

  # GET /empire_master_nm_lists or /empire_master_nm_lists.json
  def index
    @empire_master_nm_lists = EmpireMasterNmList.all
    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterNmList.delete_all
      EmpireState.where(st: 'NM').update_all list_size: 0
      redirect_to empire_master_nm_lists_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_nm_lists.to_csv, filename: "Empire_Master_NM_List-#{Date.today}.csv" }
    end

  end

  # GET /empire_master_nm_lists/1 or /empire_master_nm_lists/1.json
  def show
  end

  # GET /empire_master_nm_lists/new
  def new
    @empire_master_nm_list = EmpireMasterNmList.new
  end

  # GET /empire_master_nm_lists/1/edit
  def edit
  end

  # POST /empire_master_nm_lists or /empire_master_nm_lists.json
  def create
    @empire_master_nm_list = EmpireMasterNmList.new(empire_master_nm_list_params)

    respond_to do |format|
      if @empire_master_nm_list.save
        format.html { redirect_to @empire_master_nm_list, notice: "Empire master nm list was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_nm_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_nm_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_nm_lists/1 or /empire_master_nm_lists/1.json
  def update
    respond_to do |format|
      if @empire_master_nm_list.update(empire_master_nm_list_params)
        format.html { redirect_to @empire_master_nm_list, notice: "Empire master nm list was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_nm_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_nm_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_nm_lists/1 or /empire_master_nm_lists/1.json
  def destroy
    @empire_master_nm_list.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_nm_lists_url, notice: "Empire master nm list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterNmList.my_import(params[:file])
    redirect_to empire_master_nm_lists_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_nm_list
      @empire_master_nm_list = EmpireMasterNmList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_nm_list_params
      params.require(:empire_master_nm_list).permit(:lid, :list, :lic, :lic_state, :record_type, :lic_status, :iss_date_s, :iss_date, :exp_date_s, :exp_date, :fname, :mi, :lname, :suf, :co, :add, :add2, :city, :st, :zip, :email, :phone, :bad, :new)
    end
end
