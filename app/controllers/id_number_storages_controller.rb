class IdNumberStoragesController < ApplicationController
  before_action :set_id_number_storage, only: %i[ show edit update destroy ]

  # GET /id_number_storages or /id_number_storages.json
  def index
    @id_number_storages = IdNumberStorage.all
  end

  # GET /id_number_storages/1 or /id_number_storages/1.json
  def show
  end

  # GET /id_number_storages/new
  def new
    @id_number_storage = IdNumberStorage.new
  end

  # GET /id_number_storages/1/edit
  def edit
  end

  # POST /id_number_storages or /id_number_storages.json
  def create
    @id_number_storage = IdNumberStorage.new(id_number_storage_params)

    respond_to do |format|
      if @id_number_storage.save
        format.html { redirect_to id_number_storages_path, notice: "Id number storage was successfully created." }
        format.json { render :show, status: :created, location: @id_number_storage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @id_number_storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /id_number_storages/1 or /id_number_storages/1.json
  def update
    respond_to do |format|
      if @id_number_storage.update(id_number_storage_params)
        format.html { redirect_to id_number_storages_path(), notice: "Id number storage was successfully updated." }
        format.json { render :show, status: :ok, location: @id_number_storage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @id_number_storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /id_number_storages/1 or /id_number_storages/1.json
  def destroy
    @id_number_storage.destroy
    respond_to do |format|
      format.html { redirect_to id_number_storages_url, notice: "Id number storage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_id_number_storage
      @id_number_storage = IdNumberStorage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def id_number_storage_params
      params.require(:id_number_storage).permit(:sequoia_members_order_id, :daily_sales_id, :daily_sales_sequoia_customer_order_id, :sequoia_customer_s_id, :sequoia_member_exps_order_id, :empire_member_e_id, :empire_auto_match_id, :empire_daily_sales_id, :campaign_id)
    end
end
