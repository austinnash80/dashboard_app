class LicFixUploadsController < ApplicationController
  before_action :set_lic_fix_upload, only: %i[ show edit update destroy ]

  # GET /lic_fix_uploads or /lic_fix_uploads.json
  def index
    @lic_fix_uploads = LicFixUpload.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      LicFixUpload.delete_all
      redirect_to lic_fix_uploads_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @lic_fix_uploads.to_csv, filename: "Lic_Fix_Uploads-#{Date.today}.csv" }
    end

  end

  # GET /lic_fix_uploads/1 or /lic_fix_uploads/1.json
  def show
  end

  # GET /lic_fix_uploads/new
  def new
    @lic_fix_upload = LicFixUpload.new
  end

  # GET /lic_fix_uploads/1/edit
  def edit
  end

  # POST /lic_fix_uploads or /lic_fix_uploads.json
  def create
    @lic_fix_upload = LicFixUpload.new(lic_fix_upload_params)

    respond_to do |format|
      if @lic_fix_upload.save
        format.html { redirect_to @lic_fix_upload, notice: "Lic fix upload was successfully created." }
        format.json { render :show, status: :created, location: @lic_fix_upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lic_fix_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lic_fix_uploads/1 or /lic_fix_uploads/1.json
  def update
    respond_to do |format|
      if @lic_fix_upload.update(lic_fix_upload_params)
        format.html { redirect_to @lic_fix_upload, notice: "Lic fix upload was successfully updated." }
        format.json { render :show, status: :ok, location: @lic_fix_upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lic_fix_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lic_fix_uploads/1 or /lic_fix_uploads/1.json
  def destroy
    @lic_fix_upload.destroy
    respond_to do |format|
      format.html { redirect_to lic_fix_uploads_url, notice: "Lic fix upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    LicFixUpload.my_import(params[:file])
    redirect_to lic_fix_uploads_path(), notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lic_fix_upload
      @lic_fix_upload = LicFixUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lic_fix_upload_params
      params.require(:lic_fix_upload).permit(:uid, :lic)
    end
end
