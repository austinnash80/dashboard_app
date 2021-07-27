class AutoRenewListsController < ApplicationController
  before_action :set_auto_renew_list, only: %i[ show edit update destroy ]

  # GET /auto_renew_lists or /auto_renew_lists.json
  def index
    @auto_renew_lists = AutoRenewList.all
    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      AutoRenewList.delete_all
      redirect_to auto_renew_lists_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @auto_renew_lists.to_csv, filename: "Auto-Renew-List-#{Date.today}.csv" }
    end
  end

  # GET /auto_renew_lists/1 or /auto_renew_lists/1.json
  def show
  end

  # GET /auto_renew_lists/new
  def new
    @auto_renew_list = AutoRenewList.new
  end

  # GET /auto_renew_lists/1/edit
  def edit
  end

  # POST /auto_renew_lists or /auto_renew_lists.json
  def create
    @auto_renew_list = AutoRenewList.new(auto_renew_list_params)

    respond_to do |format|
      if @auto_renew_list.save
        format.html { redirect_to @auto_renew_list, notice: "Auto renew list was successfully created." }
        format.json { render :show, status: :created, location: @auto_renew_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @auto_renew_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auto_renew_lists/1 or /auto_renew_lists/1.json
  def update
    respond_to do |format|
      if @auto_renew_list.update(auto_renew_list_params)
        format.html { redirect_to @auto_renew_list, notice: "Auto renew list was successfully updated." }
        format.json { render :show, status: :ok, location: @auto_renew_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @auto_renew_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auto_renew_lists/1 or /auto_renew_lists/1.json
  def destroy
    @auto_renew_list.destroy
    respond_to do |format|
      format.html { redirect_to auto_renew_lists_url, notice: "Auto renew list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    AutoRenewList.my_import(params[:file])

  #REMOVE DUPLICATES ON IMPORT
    ids = AutoRenewList.group('uid').pluck('MAX(id)')
    AutoRenewList.where.not(id: ids).delete_all

    redirect_to auto_renew_lists_path(), notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_renew_list
      @auto_renew_list = AutoRenewList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auto_renew_list_params
      params.require(:auto_renew_list).permit(:uid)
    end
end
