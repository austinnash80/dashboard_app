class MktgPostcardsController < ApplicationController
  before_action :set_mktg_postcard, only: %i[ show edit update destroy ]

  # GET /mktg_postcards or /mktg_postcards.json
  def day
    if params['day'].present?
      @day = params['day'].to_date
    end

    if params['sent'].present?
      MktgPostcard.where(id: params['campaign_id']).update_all done: true, sent: params['sent']
      redirect_to day_mktg_postcards_path(day: params['day'])
    end

  end
  def index
    @mktg_postcards = MktgPostcard.all


    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MktgPostcard.delete_all
      redirect_to mktg_postcards_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @mktg_postcards.to_csv, filename: "mktg_postcards-#{Date.today}.csv" }
    end
  end

  # GET /mktg_postcards/1 or /mktg_postcards/1.json
  def show
  end

  # GET /mktg_postcards/new
  def new
    @mktg_postcard = MktgPostcard.new
  end

  # GET /mktg_postcards/1/edit
  def edit
  end

  # POST /mktg_postcards or /mktg_postcards.json
  def create
    @mktg_postcard = MktgPostcard.new(mktg_postcard_params)

    respond_to do |format|
      if @mktg_postcard.save
        format.html { redirect_to @mktg_postcard, notice: "Mktg postcard was successfully created." }
        format.json { render :show, status: :created, location: @mktg_postcard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mktg_postcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mktg_postcards/1 or /mktg_postcards/1.json
  def update
    respond_to do |format|
      if @mktg_postcard.update(mktg_postcard_params)
        format.html { redirect_to @mktg_postcard, notice: "Mktg postcard was successfully updated." }
        format.json { render :show, status: :ok, location: @mktg_postcard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mktg_postcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mktg_postcards/1 or /mktg_postcards/1.json
  def destroy
    @mktg_postcard.destroy
    respond_to do |format|
      format.html { redirect_to mktg_postcards_url, notice: "Mktg postcard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    MktgPostcard.my_import(params[:file])
    redirect_to mktg_postcards_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mktg_postcard
      @mktg_postcard = MktgPostcard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mktg_postcard_params
      params.require(:mktg_postcard).permit(:campaign_id, :campaign, :company, :delivery_type, :mail_day, :range_1_a, :range_1_b, :range_2_a, :range_2_b, :range_3_a, :range_3_b, :done, :cpa_sent, :ea_sent, :notes, :segment, :sent, :drop_day, :land_day)
    end
end
