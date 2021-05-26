class EmpireMasterDoubleAccountsController < ApplicationController
  before_action :set_empire_master_double_account, only: %i[ show edit update destroy ]

  # GET /empire_master_double_accounts or /empire_master_double_accounts.json
  def index
    @empire_master_double_accounts = EmpireMasterDoubleAccount.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterDoubleAccount.delete_all
      redirect_to empire_master_double_accounts_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_double_accounts.to_csv, filename: "Empire-Master-Double-Accounts-#{Date.today}.csv" }
    end

  end

  # GET /empire_master_double_accounts/1 or /empire_master_double_accounts/1.json
  def show
  end

  # GET /empire_master_double_accounts/new
  def new
    @empire_master_double_account = EmpireMasterDoubleAccount.new
  end

  # GET /empire_master_double_accounts/1/edit
  def edit
  end

  # POST /empire_master_double_accounts or /empire_master_double_accounts.json
  def create
    @empire_master_double_account = EmpireMasterDoubleAccount.new(empire_master_double_account_params)

    respond_to do |format|
      if @empire_master_double_account.save
        format.html { redirect_to @empire_master_double_account, notice: "Empire master double account was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_double_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_double_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_double_accounts/1 or /empire_master_double_accounts/1.json
  def update
    respond_to do |format|
      if @empire_master_double_account.update(empire_master_double_account_params)
        format.html { redirect_to @empire_master_double_account, notice: "Empire master double account was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_double_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_double_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_double_accounts/1 or /empire_master_double_accounts/1.json
  def destroy
    @empire_master_double_account.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_double_accounts_url, notice: "Empire master double account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterDoubleAccount.my_import(params[:file])
    redirect_to empire_master_double_accounts_path(), notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_double_account
      @empire_master_double_account = EmpireMasterDoubleAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_double_account_params
      params.require(:empire_master_double_account).permit(:uid, :lic_st, :list, :lname, :search_date)
    end
end
