class EmpireMasterNjListsController < ApplicationController
  before_action :set_empire_master_nj_list, only: %i[ show edit update destroy ]

  # GET /empire_master_nj_lists or /empire_master_nj_lists.json
  def index
    @empire_master_nj_lists = EmpireMasterNjList.all
    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterNjList.delete_all
      redirect_to empire_master_nj_lists_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_nj_lists.to_csv, filename: "Empire_Master_NJ_List-#{Date.today}.csv" }
    end
    if params['run'] == 'lic_fix'
      lic_fix
    end
  end

  def lic_fix

    @empire_master_nj_lists.all.each do |i|
      if i.lic.present? && i.lic.length != 7
        if i.lic.length == 1
          EmpireMasterNJList.where(id: i.id).update_all lic: '000000' + i.lic
        elsif i.lic.length == 2
          EmpireMasterNJList.where(id: i.id).update_all lic: '00000' + i.lic
        elsif i.lic.length == 3
          EmpireMasterNJList.where(id: i.id).update_all lic: '0000' + i.lic
        elsif i.lic.length == 4
          EmpireMasterNJList.where(id: i.id).update_all lic: '000' + i.lic
        elsif i.lic.length == 5
          EmpireMasterNJList.where(id: i.id).update_all lic: '00' + i.lic
        elsif i.lic.length == 6
          EmpireMasterNJList.where(id: i.id).update_all lic: '0' + i.lic
        end
      end
    end

  end

  # GET /empire_master_nj_lists/1 or /empire_master_nj_lists/1.json
  def show
  end

  # GET /empire_master_nj_lists/new
  def new
    @empire_master_nj_list = EmpireMasterNjList.new
  end

  # GET /empire_master_nj_lists/1/edit
  def edit
  end

  # POST /empire_master_nj_lists or /empire_master_nj_lists.json
  def create
    @empire_master_nj_list = EmpireMasterNjList.new(empire_master_nj_list_params)

    respond_to do |format|
      if @empire_master_nj_list.save
        format.html { redirect_to @empire_master_nj_list, notice: "Empire master nj list was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_nj_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_nj_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_nj_lists/1 or /empire_master_nj_lists/1.json
  def update
    respond_to do |format|
      if @empire_master_nj_list.update(empire_master_nj_list_params)
        format.html { redirect_to @empire_master_nj_list, notice: "Empire master nj list was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_nj_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_nj_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def import #Uploading CSV function
    EmpireMasterNjList.my_import(params[:file])
    list = EmpireMasterNjList.first(1).pluck(:list)
      y = list.join[2,4]
      m = list.join[6,2]
      d = list.join[8,2]
    EmpireState.where(st: 'NJ').update_all list_size: EmpireMasterNjList.count, list_date: y+'-'+m+"-"+d
    redirect_to empire_master_nj_lists_path, notice: "Upload Complete"
  end

  # DELETE /empire_master_nj_lists/1 or /empire_master_nj_lists/1.json
  def destroy
    @empire_master_nj_list.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_nj_lists_url, notice: "Empire master nj list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_nj_list
      @empire_master_nj_list = EmpireMasterNjList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_nj_list_params
      params.require(:empire_master_nj_list).permit(:lid, :list, :lic_state, :lic, :record_type, :lic_status, :iss_date_s, :iss_date, :exp_date_s, :exp_date, :fname, :mi, :lname, :add, :add2, :city, :st, :zip, :email, :phone)
    end
end
