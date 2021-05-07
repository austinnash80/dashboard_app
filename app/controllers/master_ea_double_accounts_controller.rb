class MasterEaDoubleAccountsController < ApplicationController
  before_action :set_master_ea_double_account, only: %i[ show edit update destroy ]

  # GET /master_ea_double_accounts or /master_ea_double_accounts.json
  def index
    @master_ea_double_accounts = MasterEaDoubleAccount.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MasterEaDoubleAccount.delete_all
      redirect_to master_ea_double_accounts_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @master_ea_double_accounts.to_csv, filename: "Sequoia-Master-EA-Double-Account-#{Date.today}.csv" }
    end

  end

  # GET /master_ea_double_accounts/1 or /master_ea_double_accounts/1.json
  def show
  end

  # GET /master_ea_double_accounts/new
  def new
    @master_ea_double_account = MasterEaDoubleAccount.new
  end

  # GET /master_ea_double_accounts/1/edit
  def edit
  end

  # POST /master_ea_double_accounts or /master_ea_double_accounts.json
  def create
    @master_ea_double_account = MasterEaDoubleAccount.new(master_ea_double_account_params)

    respond_to do |format|
      if @master_ea_double_account.save
        format.html { redirect_to @master_ea_double_account, notice: "Master ea double account was successfully created." }
        format.json { render :show, status: :created, location: @master_ea_double_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_ea_double_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_ea_double_accounts/1 or /master_ea_double_accounts/1.json
  def update
    respond_to do |format|
      if @master_ea_double_account.update(master_ea_double_account_params)
        format.html { redirect_to @master_ea_double_account, notice: "Master ea double account was successfully updated." }
        format.json { render :show, status: :ok, location: @master_ea_double_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_ea_double_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_ea_double_accounts/1 or /master_ea_double_accounts/1.json
  def destroy
    @master_ea_double_account.destroy
    respond_to do |format|
      format.html { redirect_to master_ea_double_accounts_url, notice: "Master ea double account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MasterEaDoubleAccount.my_import(params[:file])
    redirect_to master_ea_double_accounts_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_ea_double_account
      @master_ea_double_account = MasterEaDoubleAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_ea_double_account_params
      params.require(:master_ea_double_account).permit(:lid, :list, :uid, :lname, :search_date)
    end
end
