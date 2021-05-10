class MasterCpaNoMailsController < ApplicationController
  before_action :set_master_cpa_no_mail, only: %i[ show edit update destroy ]

  # GET /master_cpa_no_mails or /master_cpa_no_mails.json
  def index
    @master_cpa_no_mails = MasterCpaNoMail.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MasterCpaNoMail.delete_all
      redirect_to master_cpa_no_mails_path(), notice: 'Records Deleted'
    end
    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @master_cpa_no_mails.to_csv, filename: "Sequoia-CPA-No-Mail-#{Date.today}.csv" }
    end

    # ADD NEW NO MAIL FROM SEARCH (Sequoia_matchings/cpa_no_mail)
    if params['match'] == 'yes'
      MasterCpaNoMail.create(lid: params['lid'], list: params['list'], lname: params['lname'], search_date: Date.today).save
    end
  end

  # GET /master_cpa_no_mails/1 or /master_cpa_no_mails/1.json
  def show
  end

  # GET /master_cpa_no_mails/new
  def new
    @master_cpa_no_mail = MasterCpaNoMail.new
  end

  # GET /master_cpa_no_mails/1/edit
  def edit
  end

  # POST /master_cpa_no_mails or /master_cpa_no_mails.json
  def create
    @master_cpa_no_mail = MasterCpaNoMail.new(master_cpa_no_mail_params)

    respond_to do |format|
      if @master_cpa_no_mail.save
        format.html { redirect_to @master_cpa_no_mail, notice: "Master cpa no mail was successfully created." }
        format.json { render :show, status: :created, location: @master_cpa_no_mail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_cpa_no_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_cpa_no_mails/1 or /master_cpa_no_mails/1.json
  def update
    respond_to do |format|
      if @master_cpa_no_mail.update(master_cpa_no_mail_params)
        format.html { redirect_to @master_cpa_no_mail, notice: "Master cpa no mail was successfully updated." }
        format.json { render :show, status: :ok, location: @master_cpa_no_mail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_cpa_no_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_cpa_no_mails/1 or /master_cpa_no_mails/1.json
  def destroy
    @master_cpa_no_mail.destroy
    respond_to do |format|
      format.html { redirect_to master_cpa_no_mails_url, notice: "Master cpa no mail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MasterCpaNoMail.my_import(params[:file])
    redirect_to master_cpa_no_mails_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_cpa_no_mail
      @master_cpa_no_mail = MasterCpaNoMail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_cpa_no_mail_params
      params.require(:master_cpa_no_mail).permit(:lid, :list, :lname, :search_date, :note)
    end
end
