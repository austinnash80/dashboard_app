class SequoiaCustomersController < ApplicationController
  before_action :set_sequoia_customer, only: %i[ show edit update destroy ]

  # GET /sequoia_customers or /sequoia_customers.json
  def index
    run_data
    @sequoia_customers = SequoiaCustomer.order(id: :desc).all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      SequoiaCustomer.delete_all
      redirect_to sequoia_customers_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @sequoia_customers.to_csv, filename: "Sequoia-Customers-#{Date.today}.csv" }
    end
  end

  def run_update
    @id = SequoiaCustomer.pluck(:s_id).max
    # WHEN DONE THE REDIRECT TO OTHER UPDATES
    # unless params['s_id'].present?
    #   redirect_to run_update_sequoia_members_path()
    # end
  end

  def run_data
    if params['s_id'].present?
        new = SequoiaCustomer.create(
          s_id: params['s_id'].present? ? params['s_id'].to_i : 0,
          order_id: params['order_id'],
          uid: params['uid'],
          existing: params['existing'],
          purchase_s: params['purchase'],
          purchase: params['purchase'].present? ? Date::strptime(params['purchase'],"%m/%d/%Y") : '',
          product_1: params['product_1'],
          product_2: params['product_2'],
          designation: params['designation'],
          fname: params['fname'],
          lname: params['lname'],
          city: params['city'],
          state: params['state'],
          zip: params['zip'],
          email: params['email'],
          price_s: params['price'],
          price: params['price'].present? ? ((params['price'].to_f) * 100) : 0,
          lic_num: params['lic_num'],
          lic_state: params['lic_state'],
          street_1: params['street_1'],
          street_2: params['street_2']
        )
        new.save
      redirect_to run_update_sequoia_customers_path
    end
  end

  # GET /sequoia_customers/1 or /sequoia_customers/1.json
  def show
  end

  # GET /sequoia_customers/new
  def new
    @sequoia_customer = SequoiaCustomer.new
  end

  # GET /sequoia_customers/1/edit
  def edit
  end

  # POST /sequoia_customers or /sequoia_customers.json
  def create
    @sequoia_customer = SequoiaCustomer.new(sequoia_customer_params)

    respond_to do |format|
      if @sequoia_customer.save
        format.html { redirect_to @sequoia_customer, notice: "Sequoia customer was successfully created." }
        format.json { render :show, status: :created, location: @sequoia_customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sequoia_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequoia_customers/1 or /sequoia_customers/1.json
  def update
    respond_to do |format|
      if @sequoia_customer.update(sequoia_customer_params)
        format.html { redirect_to @sequoia_customer, notice: "Sequoia customer was successfully updated." }
        format.json { render :show, status: :ok, location: @sequoia_customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sequoia_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def import #Uploading CSV function
    SequoiaCustomer.my_import(params[:file])
    redirect_to sequoia_customers_path, notice: "Upload Complete"
  end

  # DELETE /sequoia_customers/1 or /sequoia_customers/1.json
  def destroy
    @sequoia_customer.destroy
    respond_to do |format|
      format.html { redirect_to sequoia_customers_url, notice: "Sequoia customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequoia_customer
      @sequoia_customer = SequoiaCustomer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sequoia_customer_params
      params.require(:sequoia_customer).permit(:s_id, :order_id, :uid, :lic_state, :lic_num, :exisiting, :purchase_s, :purchase, :price_s, :price, :product_1, :product_2, :designation, :email, :fname, :lname, :street_1, :street_2, :city, :state, :zip)
    end
end
