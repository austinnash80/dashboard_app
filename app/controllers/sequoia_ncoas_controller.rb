class SequoiaNcoasController < ApplicationController
  before_action :set_sequoia_ncoa, only: %i[ show edit update destroy ]

  # GET /sequoia_ncoas or /sequoia_ncoas.json
  def index
    @sequoia_ncoas = SequoiaNcoa.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      SequoiaNcoa.delete_all
      redirect_to sequoia_ncoas_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @sequoia_ncoas.to_csv, filename: "Sequoia-NCOAs-#{Date.today}.csv" }
    end
  end

  # GET /sequoia_ncoas/1 or /sequoia_ncoas/1.json
  def show
  end

  # GET /sequoia_ncoas/new
  def new
    @sequoia_ncoa = SequoiaNcoa.new
  end

  # GET /sequoia_ncoas/1/edit
  def edit
  end

  # POST /sequoia_ncoas or /sequoia_ncoas.json
  def create
    @sequoia_ncoa = SequoiaNcoa.new(sequoia_ncoa_params)

    respond_to do |format|
      if @sequoia_ncoa.save
        format.html { redirect_to @sequoia_ncoa, notice: "Sequoia ncoa was successfully created." }
        format.json { render :show, status: :created, location: @sequoia_ncoa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sequoia_ncoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequoia_ncoas/1 or /sequoia_ncoas/1.json
  def update
    respond_to do |format|
      if @sequoia_ncoa.update(sequoia_ncoa_params)
        format.html { redirect_to @sequoia_ncoa, notice: "Sequoia ncoa was successfully updated." }
        format.json { render :show, status: :ok, location: @sequoia_ncoa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sequoia_ncoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequoia_ncoas/1 or /sequoia_ncoas/1.json
  def destroy
    @sequoia_ncoa.destroy
    respond_to do |format|
      format.html { redirect_to sequoia_ncoas_url, notice: "Sequoia ncoa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    SequoiaNcoa.my_import(params[:file])
    redirect_to sequoia_ncoas_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequoia_ncoa
      @sequoia_ncoa = SequoiaNcoa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sequoia_ncoa_params
      params.require(:sequoia_ncoa).permit(:uid, :ncoa_list, :stree_1, :street_2, :city, :state, :zip, :good, :bad)
    end
end
