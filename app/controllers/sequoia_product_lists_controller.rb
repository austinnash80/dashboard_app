class SequoiaProductListsController < ApplicationController
  before_action :set_sequoia_product_list, only: %i[ show edit update destroy ]

  # GET /sequoia_product_lists or /sequoia_product_lists.json
  def index
    @sequoia_product_lists = SequoiaProductList.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      SequoiaProductList.delete_all
      redirect_to sequoia_product_lists_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @sequoia_product_lists.to_csv, filename: "Sequoia-Product_List-#{Date.today}.csv" }
    end
  end

  # GET /sequoia_product_lists/1 or /sequoia_product_lists/1.json
  def show
  end

  # GET /sequoia_product_lists/new
  def new
    @sequoia_product_list = SequoiaProductList.new
  end

  # GET /sequoia_product_lists/1/edit
  def edit
  end

  # POST /sequoia_product_lists or /sequoia_product_lists.json
  def create
    @sequoia_product_list = SequoiaProductList.new(sequoia_product_list_params)

    respond_to do |format|
      if @sequoia_product_list.save
        format.html { redirect_to @sequoia_product_list, notice: "Sequoia product list was successfully created." }
        format.json { render :show, status: :created, location: @sequoia_product_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sequoia_product_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequoia_product_lists/1 or /sequoia_product_lists/1.json
  def update
    respond_to do |format|
      if @sequoia_product_list.update(sequoia_product_list_params)
        format.html { redirect_to @sequoia_product_list, notice: "Sequoia product list was successfully updated." }
        format.json { render :show, status: :ok, location: @sequoia_product_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sequoia_product_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequoia_product_lists/1 or /sequoia_product_lists/1.json
  def destroy
    @sequoia_product_list.destroy
    respond_to do |format|
      format.html { redirect_to sequoia_product_lists_url, notice: "Sequoia product list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    SequoiaProductList.my_import(params[:file])
    redirect_to sequoia_product_lists_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequoia_product_list
      @sequoia_product_list = SequoiaProductList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sequoia_product_list_params
      params.require(:sequoia_product_list).permit(:product, :who, :group, :full_price, :renewal_price)
    end
end
