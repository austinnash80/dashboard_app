class CannedResponsesController < ApplicationController
  before_action :set_canned_response, only: %i[ show edit update destroy ]

  # GET /canned_responses or /canned_responses.json
  def index
    @canned_responses = CannedResponse.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      CannedResponse.delete_all
      redirect_to canned_responses_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @canned_responses.to_csv, filename: "Canned-Responses-#{Date.today}.csv" }
    end
  end

  # GET /canned_responses/1 or /canned_responses/1.json
  def show
  end

  # GET /canned_responses/new
  def new
    @canned_response = CannedResponse.new
  end

  # GET /canned_responses/1/edit
  def edit
  end

  # POST /canned_responses or /canned_responses.json
  def create
    @canned_response = CannedResponse.new(canned_response_params)

    respond_to do |format|
      if @canned_response.save
        format.html { redirect_to @canned_response, notice: "Canned response was successfully created." }
        format.json { render :show, status: :created, location: @canned_response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @canned_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canned_responses/1 or /canned_responses/1.json
  def update
    respond_to do |format|
      if @canned_response.update(canned_response_params)
        format.html { redirect_to @canned_response, notice: "Canned response was successfully updated." }
        format.json { render :show, status: :ok, location: @canned_response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @canned_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canned_responses/1 or /canned_responses/1.json
  def destroy
    @canned_response.destroy
    respond_to do |format|
      format.html { redirect_to canned_responses_url, notice: "Canned response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    CannedResponse.my_import(params[:file])
    redirect_to canned_responses_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canned_response
      @canned_response = CannedResponse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def canned_response_params
      params.require(:canned_response).permit(:company, :des, :state, :questions, :answer, :notes)
    end
end
