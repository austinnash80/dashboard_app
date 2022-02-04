class EmpireCustomersController < ApplicationController
  before_action :set_empire_customer, only: %i[ show edit update destroy ]

  # GET /empire_customers or /empire_customers.json
  def index
    run_data
    @empire_customers = EmpireCustomer.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireCustomer.delete_all
      redirect_to empire_customers_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_customers.to_csv, filename: "Empire-Customers-#{Date.today}.csv" }
    end

  end

  def run_update
    @id = EmpireCustomer.pluck(:e_id).max
  end

  def run_data
    if params['e_id'].present?
        new = EmpireCustomer.create(
          e_id: params['e_id'].present? ? params['e_id'].to_i : 0,
          uid: params['uid'],
          existing: params['existing'],
          purchase_s: params['purchase_date'],
          purchase: params['purchase_date'].present? ? Date::strptime(params['purchase_date'],"%m/%d/%y") : '',
          product: params['products'],
          fname: params['fname'].present? ? params['fname'].upcase : '',
          lname: params['lname'].present? ? params['lname'].upcase : '',
          city: params['city'].present? ? params['city'].upcase : '',
          state: params['state'].present? ? params['state'].upcase : '',
          zip: params['zip'],
          email: params['email'],
          price_s: params['order_total'],
          price: params['order_total'].present? ? ((params['order_total'].to_f) * 100) : 0,
          lic_num: params['lic_num'].present? ? params['lic_num'].upcase : '',
          lic_state: params['lic_state'],
          street_1: params['street_1'].present? ? params['street_1'].upcase : '',
          street_2: params['street_2'].present? ? params['street_2'].upcase : ''
        )
        new.save
      redirect_to run_update_empire_customers_path
    end

  end

  # GET /empire_customers/1 or /empire_customers/1.json
  def show
  end

  # GET /empire_customers/new
  def new
    @empire_customer = EmpireCustomer.new
  end

  # GET /empire_customers/1/edit
  def edit
  end

  # POST /empire_customers or /empire_customers.json
  def create
    @empire_customer = EmpireCustomer.new(empire_customer_params)

    respond_to do |format|
      if @empire_customer.save
        format.html { redirect_to @empire_customer, notice: "Empire customer was successfully created." }
        format.json { render :show, status: :created, location: @empire_customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_customers/1 or /empire_customers/1.json
  def update
    respond_to do |format|
      if @empire_customer.update(empire_customer_params)
        format.html { redirect_to @empire_customer, notice: "Empire customer was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_customers/1 or /empire_customers/1.json
  def destroy
    @empire_customer.destroy
    respond_to do |format|
      format.html { redirect_to empire_customers_url, notice: "Empire customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireCustomer.my_import(params[:file])
    redirect_to empire_customers_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_customer
      @empire_customer = EmpireCustomer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_customer_params
      params.require(:empire_customer).permit(:e_id, :uid, :lic_state, :lic_num, :existing, :purchase_s, :purchase, :price_s, :price, :product, :email, :fname, :lname, :street_1, :street_2, :city, :state, :zip)
    end
end
