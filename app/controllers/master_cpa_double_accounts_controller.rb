class MasterCpaDoubleAccountsController < ApplicationController
  before_action :set_master_cpa_double_account, only: %i[ show edit update destroy ]

  # GET /master_cpa_double_accounts or /master_cpa_double_accounts.json
  def index
    @master_cpa_double_accounts = MasterCpaDoubleAccount.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MasterCpaDoubleAccount.delete_all
      redirect_to master_cpa_double_accounts_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @master_cpa_double_accounts.to_csv, filename: "Sequoia-CPA-Double-Account-#{Date.today}.csv" }
    end
  end

  # GET /master_cpa_double_accounts/1 or /master_cpa_double_accounts/1.json
  def show
  end

  # GET /master_cpa_double_accounts/new
  def new
    @master_cpa_double_account = MasterCpaDoubleAccount.new
  end

  # GET /master_cpa_double_accounts/1/edit
  def edit
  end

  # POST /master_cpa_double_accounts or /master_cpa_double_accounts.json
  def create
    @master_cpa_double_account = MasterCpaDoubleAccount.new(master_cpa_double_account_params)

    respond_to do |format|
      if @master_cpa_double_account.save
        format.html { redirect_to @master_cpa_double_account, notice: "Master cpa double account was successfully created." }
        format.json { render :show, status: :created, location: @master_cpa_double_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_cpa_double_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_cpa_double_accounts/1 or /master_cpa_double_accounts/1.json
  def update
    respond_to do |format|
      if @master_cpa_double_account.update(master_cpa_double_account_params)
        format.html { redirect_to @master_cpa_double_account, notice: "Master cpa double account was successfully updated." }
        format.json { render :show, status: :ok, location: @master_cpa_double_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_cpa_double_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_cpa_double_accounts/1 or /master_cpa_double_accounts/1.json
  def destroy
    @master_cpa_double_account.destroy
    respond_to do |format|
      format.html { redirect_to master_cpa_double_accounts_url, notice: "Master cpa double account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MasterCpaDoubleAccount.my_import(params[:file])
    redirect_to master_cpa_double_accounts_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_cpa_double_account
      @master_cpa_double_account = MasterCpaDoubleAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_cpa_double_account_params
      params.require(:master_cpa_double_account).permit(:lid, :list, :uid, :lname, :search_date)
    end
end
