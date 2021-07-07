class DailySalesEmpiresController < ApplicationController
  before_action :set_daily_sales_empire, only: %i[ show edit update destroy ]

  # GET /daily_sales_empires or /daily_sales_empires.json
  def index
    @daily_sales_empires = DailySalesEmpire.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      DailySalesEmpire.delete_all
      redirect_to daily_sales_empires_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @daily_sales_empires.to_csv, filename: "Empire-daily_sales-#{Date.today}.csv" }
    end
  end

  def run_update

    empire_daily_sales_id = IdNumberStorage.pluck(:empire_daily_sales_id)[0]

    DailySalesEmpire.where("id > ?", empire_daily_sales_id).order(id: :asc).each do |i|
      sales = EmpireCustomer.where(purchase: i.day).sum(:price)
      orders = EmpireCustomer.where(purchase: i.day).count(:price)
      DailySalesEmpire.where(id: i.id).update_all sales: sales, orders: orders
      unless i.sales == 0
        IdNumberStorage.update_all empire_daily_sales_id: i.id
      end
    end

    redirect_to daily_sales_empires_path(), notice: 'Update Complete'

  end

  def monthly

  end

  # GET /daily_sales_empires/1 or /daily_sales_empires/1.json
  def show
  end

  # GET /daily_sales_empires/new
  def new
    @daily_sales_empire = DailySalesEmpire.new
  end

  # GET /daily_sales_empires/1/edit
  def edit
  end

  # POST /daily_sales_empires or /daily_sales_empires.json
  def create
    @daily_sales_empire = DailySalesEmpire.new(daily_sales_empire_params)

    respond_to do |format|
      if @daily_sales_empire.save
        format.html { redirect_to @daily_sales_empire, notice: "Daily sales empire was successfully created." }
        format.json { render :show, status: :created, location: @daily_sales_empire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_sales_empire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_sales_empires/1 or /daily_sales_empires/1.json
  def update
    respond_to do |format|
      if @daily_sales_empire.update(daily_sales_empire_params)
        format.html { redirect_to @daily_sales_empire, notice: "Daily sales empire was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_sales_empire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_sales_empire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_sales_empires/1 or /daily_sales_empires/1.json
  def destroy
    @daily_sales_empire.destroy
    respond_to do |format|
      format.html { redirect_to daily_sales_empires_url, notice: "Daily sales empire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    DailySalesEmpire.my_import(params[:file])
    redirect_to daily_sales_empires_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_sales_empire
      @daily_sales_empire = DailySalesEmpire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_sales_empire_params
      params.require(:daily_sales_empire).permit(:day, :year, :month, :day_of_week, :sales, :orders)
    end
end
