class DailySalesController < ApplicationController
  before_action :set_daily_sale, only: %i[ show edit update destroy ]

  # GET /daily_sales or /daily_sales.json
  def index
    @daily_sales = DailySale.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      DailySale.delete_all
      redirect_to daily_sales_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @daily_sales.to_csv, filename: "Sequoia-daily_sales-#{Date.today}.csv" }
    end
  end

  def monthly
    @daily_sales = DailySale.all
  end

  def run_update
      if params['update'] == 'run'
        cpa_new = SequoiaProductList.where(who: 'cpa').where(group: 'membership').where(full_price: true).pluck(:product)
        cpa_renewal = SequoiaProductList.where(who: 'cpa').where(group: 'membership').where(renewal_price: true).pluck(:product)
        ea_new = SequoiaProductList.where(who: 'ea').where(group: 'membership').where(full_price: true).pluck(:product)
        ea_renewal = SequoiaProductList.where(who: 'ea').where(group: 'membership').where(renewal_price: true).pluck(:product)
        afsp = SequoiaProductList.where(who: 'afsp').pluck(:product)
        ethics = SequoiaProductList.where(group: 'ethics').pluck(:product)
        other = SequoiaProductList.where(group: 'upgrade').pluck(:product)

        s_id = IdNumberStorage.pluck(:sequoia_customer_s_id)[0]
        daily_sales_id = IdNumberStorage.pluck(:daily_sales_id)[0]

        # Use ID as the start number = id_number_storages
        # date_range = (Date.parse('2014-09-04')..Date.parse('2015-12-31'))
        # date_range = (Date.parse('2014-05-30')..Date.parse('2014-09-03'))

        DailySale.where("id > ?", daily_sales_id).order(id: :asc).each do |i|

          price = SequoiaCustomer.where(purchase: i.day).sum(:price)
          if i.day.present?
            cpa_new_count = SequoiaCustomer.where(purchase: i.day).where(product_1: cpa_new).count
            cpa_renewal_count = SequoiaCustomer.where(purchase: i.day).where(product_1: cpa_renewal).count
            ea_new_count = SequoiaCustomer.where(purchase: i.day).where(product_1: ea_new).count
            ea_renewal_count = SequoiaCustomer.where(purchase: i.day).where(product_1: ea_renewal).count
            afsp_count = SequoiaCustomer.where(purchase: i.day).where(product_1: afsp).count
            ethics_count = (SequoiaCustomer.where(purchase: i.day).where(product_1: ethics).count + SequoiaCustomer.where(purchase: i.day).where(product_2: ethics).count)
            other_count = SequoiaCustomer.where(purchase: i.day).where(product_1: other).count
          end
          DailySale.where(id: i.id).update_all sales: price, cpa_full_price: cpa_new_count, cpa_renewal_price: cpa_renewal_count, ea_full_price: ea_new_count, ea_renewal_price: ea_renewal_count, afsp: afsp_count, ethics: ethics_count, other: other_count

          unless i.sales == 0
            IdNumberStorage.update_all daily_sales_id: i.id
          end
        end

        redirect_to daily_sales_path(), notice: 'Update Complete'

        # SequoiaCustomer.order(s_id: :asc).where("s_id > ?", s_id).limit(10000).all.each do |i|
        # # SequoiaCustomer.order(order_id: :asc).where.not(order_id: order_id).all.each do |i|
        # # SequoiaCustomer.order(order_id: :asc).where('order_id > ?', order_id).each do |i|
        #   day = DailySale.find_by(day: i.purchase)
        #
        #   DailySale.where(id: day.id).update_all sales: day.sales + i.price
        #   # DailySale.where('id > ?', daily_sales_id).where(id: day.id).update_all sales: day.sales + i.price
        #
        #   if cpa_new.include? i.product_1
        #     DailySale.where(id: day.id).update_all cpa_full_price: day.cpa_full_price + 1
        #   elsif cpa_renewal.include? i.product_1
        #     DailySale.where(id: day.id).update_all cpa_renewal_price: day.cpa_renewal_price + 1
        #   elsif ea_new.include? i.product_1
        #     DailySale.where(id: day.id).update_all ea_full_price: day.ea_full_price + 1
        #   elsif ea_renewal.include? i.product_1
        #     DailySale.where(id: day.id).update_all ea_renewal_price: day.ea_renewal_price + 1
        #   elsif ethics.include? i.product_1
        #     DailySale.where(id: day.id).update_all ethics: day.ethics + 1
        #   elsif afsp.include? i.product_1
        #     DailySale.where(id: day.id).update_all afsp: day.afsp + 1
        #   elsif other.include? i.product_1
        #     DailySale.where(id: day.id).update_all other: day.other + 1
        #   end
        #
        #   if ethics.include? i.product_2
        #     DailySale.where(id: day.id).update_all ethics: day.ethics + 1
        #   end
        #
        #   IdNumberStorage.update_all(sequoia_customer_s_id: i.s_id)
        #   IdNumberStorage.update_all daily_sales_id: i.id
        #
        #   end
        #   redirect_to daily_sales_path(), notice: 'Update Complete'
      end
  end

  # GET /daily_sales/1 or /daily_sales/1.json
  def show
  end

  # GET /daily_sales/new
  def new
    @daily_sale = DailySale.new
  end

  # GET /daily_sales/1/edit
  def edit
  end

  # POST /daily_sales or /daily_sales.json
  def create
    @daily_sale = DailySale.new(daily_sale_params)

    respond_to do |format|
      if @daily_sale.save
        format.html { redirect_to @daily_sale, notice: "Daily sale was successfully created." }
        format.json { render :show, status: :created, location: @daily_sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_sales/1 or /daily_sales/1.json
  def update
    respond_to do |format|
      if @daily_sale.update(daily_sale_params)
        format.html { redirect_to @daily_sale, notice: "Daily sale was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_sales/1 or /daily_sales/1.json
  def destroy
    @daily_sale.destroy
    respond_to do |format|
      format.html { redirect_to daily_sales_url, notice: "Daily sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    DailySale.my_import(params[:file])
    redirect_to daily_sales_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_sale
      @daily_sale = DailySale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_sale_params
      params.require(:daily_sale).permit(:day, :year, :month, :day_of_week, :sales, :cpa_full_price, :cpa_renewal_price, :ea_full_price, :ea_renewal_price, :ethics, :afsp, :other, :renewal_price, :full_price)
    end
end
