class MasterEaNoMailsController < ApplicationController
  before_action :set_master_ea_no_mail, only: %i[ show edit update destroy ]

  # GET /master_ea_no_mails or /master_ea_no_mails.json
  def index
    @master_ea_no_mails = MasterEaNoMail.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MasterEaNoMail.delete_all
      redirect_to master_ea_no_mails_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @master_ea_no_mails.to_csv, filename: "Sequoia-Master-EA-No-Mail-#{Date.today}.csv" }
    end

    # ADD NEW NO MAIL FROM SEARCH (Sequoia_matchings/ea_no_mail)
    if params['match'] == 'yes'
      MasterEaNoMail.create(lid: params['lid'], list: params['list'], lname: params['lname'], search_date: Date.today).save
    end
  end

  # GET /master_ea_no_mails/1 or /master_ea_no_mails/1.json
  def show
  end

  # GET /master_ea_no_mails/new
  def new
    @master_ea_no_mail = MasterEaNoMail.new
  end

  # GET /master_ea_no_mails/1/edit
  def edit
  end

  # POST /master_ea_no_mails or /master_ea_no_mails.json
  def create
    @master_ea_no_mail = MasterEaNoMail.new(master_ea_no_mail_params)

    respond_to do |format|
      if @master_ea_no_mail.save
        format.html { redirect_to @master_ea_no_mail, notice: "Master ea no mail was successfully created." }
        format.json { render :show, status: :created, location: @master_ea_no_mail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_ea_no_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_ea_no_mails/1 or /master_ea_no_mails/1.json
  def update
    respond_to do |format|
      if @master_ea_no_mail.update(master_ea_no_mail_params)
        format.html { redirect_to @master_ea_no_mail, notice: "Master ea no mail was successfully updated." }
        format.json { render :show, status: :ok, location: @master_ea_no_mail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_ea_no_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_ea_no_mails/1 or /master_ea_no_mails/1.json
  def destroy
    @master_ea_no_mail.destroy
    respond_to do |format|
      format.html { redirect_to master_ea_no_mails_url, notice: "Master ea no mail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MasterEaNoMail.my_import(params[:file])
    redirect_to master_ea_no_mails_path, notice: "Upload Complete"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_ea_no_mail
      @master_ea_no_mail = MasterEaNoMail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_ea_no_mail_params
      params.require(:master_ea_no_mail).permit(:lid, :list, :lname, :search_date, :note)
    end
end
