class NoMailNotFoundsController < ApplicationController
  before_action :set_no_mail_not_found, only: %i[ show edit update destroy ]

  # GET /no_mail_not_founds or /no_mail_not_founds.json
  def index
    @no_mail_not_founds = NoMailNotFound.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      NoMailNotFound.delete_all
      redirect_to no_mail_not_founds_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @no_mail_not_founds.to_csv, filename: "No-Mail-Not-Found-#{Date.today}.csv" }
    end
  end

  # GET /no_mail_not_founds/1 or /no_mail_not_founds/1.json
  def show
  end

  # GET /no_mail_not_founds/new
  def new
    @no_mail_not_found = NoMailNotFound.new
  end

  # GET /no_mail_not_founds/1/edit
  def edit
  end

  # POST /no_mail_not_founds or /no_mail_not_founds.json
  def create
    @no_mail_not_found = NoMailNotFound.new(no_mail_not_found_params)

    respond_to do |format|
      if @no_mail_not_found.save
        format.html { redirect_to no_mail_not_founds_path, notice: "No mail not found was successfully created." }
        format.json { render :show, status: :created, location: @no_mail_not_found }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @no_mail_not_found.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /no_mail_not_founds/1 or /no_mail_not_founds/1.json
  def update
    respond_to do |format|
      if @no_mail_not_found.update(no_mail_not_found_params)
        format.html { redirect_to @no_mail_not_found, notice: "No mail not found was successfully updated." }
        format.json { render :show, status: :ok, location: @no_mail_not_found }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @no_mail_not_found.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /no_mail_not_founds/1 or /no_mail_not_founds/1.json
  def destroy
    @no_mail_not_found.destroy
    respond_to do |format|
      format.html { redirect_to no_mail_not_founds_url, notice: "No mail not found was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    NoMailNotFound.my_import(params[:file])
    redirect_to no_mail_not_founds_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_no_mail_not_found
      @no_mail_not_found = NoMailNotFound.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def no_mail_not_found_params
      params.require(:no_mail_not_found).permit(:company, :fname, :mi, :lname, :suf, :co, :add, :add2, :city, :state, :zip, :note, :des, :lic_state)
    end
end
