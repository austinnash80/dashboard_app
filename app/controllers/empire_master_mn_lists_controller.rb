class EmpireMasterMnListsController < ApplicationController
  before_action :set_empire_master_mn_list, only: %i[ show edit update destroy ]

  # GET /empire_master_mn_lists or /empire_master_mn_lists.json
  def index
    @empire_master_mn_lists = EmpireMasterMnList.all
  end

  # GET /empire_master_mn_lists/1 or /empire_master_mn_lists/1.json
  def show
  end

  # GET /empire_master_mn_lists/new
  def new
    @empire_master_mn_list = EmpireMasterMnList.new
  end

  # GET /empire_master_mn_lists/1/edit
  def edit
  end

  # POST /empire_master_mn_lists or /empire_master_mn_lists.json
  def create
    @empire_master_mn_list = EmpireMasterMnList.new(empire_master_mn_list_params)

    respond_to do |format|
      if @empire_master_mn_list.save
        format.html { redirect_to @empire_master_mn_list, notice: "Empire master mn list was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_mn_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_mn_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_mn_lists/1 or /empire_master_mn_lists/1.json
  def update
    respond_to do |format|
      if @empire_master_mn_list.update(empire_master_mn_list_params)
        format.html { redirect_to @empire_master_mn_list, notice: "Empire master mn list was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_mn_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_mn_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_mn_lists/1 or /empire_master_mn_lists/1.json
  def destroy
    @empire_master_mn_list.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_mn_lists_url, notice: "Empire master mn list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_mn_list
      @empire_master_mn_list = EmpireMasterMnList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_mn_list_params
      params.require(:empire_master_mn_list).permit(:lid, :list, :lic_state, :lic, :record_type, :lic_status, :iss_date_s, :iss_date, :exp_date_s, :exp_date, :fname, :mi, :lname, :suf, :co, :add, :add2, :city, :st, :zip, :email, :phone)
    end
end
