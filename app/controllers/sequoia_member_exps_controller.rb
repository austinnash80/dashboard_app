class SequoiaMemberExpsController < ApplicationController
  before_action :set_sequoia_member_exp, only: %i[ show edit update destroy ]

  # GET /sequoia_member_exps or /sequoia_member_exps.json
  def index
    @sequoia_member_exps = SequoiaMemberExp.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      SequoiaMemberExp.delete_all
      redirect_to sequoia_member_exps_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @sequoia_member_exps.to_csv, filename: "Sequoia-Member-EXPs-#{Date.today}.csv" }
    end

    @order_id = (IdNumberStorage.pluck(:sequoia_member_exps_order_id))[0]
    @sequia_customer_order_id = SequoiaCustomer.pluck(:order_id).max
  end
  def run_update

    order_id = (IdNumberStorage.pluck(:sequoia_member_exps_order_id))[0]
    cpa_membership = SequoiaProductList.where(who: 'cpa').where(group: 'membership').pluck(:product)
    ea_membership = SequoiaProductList.where(who: 'ea').where(group: 'membership').pluck(:product)


    SequoiaCustomer.where("order_id > ?", order_id).order(order_id: :asc).each do |i|
      if cpa_membership.include? i.product_1
        SequoiaMemberExp.where(uid: i.uid).update_all membership: 'cpa', last_membership: i.purchase, membership_exp: i.purchase + 1.year
      elsif ea_membership.include? i.product_1
        SequoiaMemberExp.where(uid: i.uid).update_all membership: 'ea', last_membership: i.purchase, membership_exp: i.purchase + 1.year
      end
      IdNumberStorage.update_all sequoia_member_exps_order_id: i.order_id
    end

    # SequoiaMemberExp.where.not(last_membership: nil).all.each do |i|
    #   sequoia_member_exp = SequoiaMemberExp.find_by(uid: i.uid)
    #   SequoiaMemberExp.where(uid: i.uid).update_all membership_exp: sequoia_member_exp.last_membership + 1.year
    # end


    redirect_to sequoia_member_exps_path(), notice: 'Update Complete'
  end

  # GET /sequoia_member_exps/1 or /sequoia_member_exps/1.json
  def show
  end

  # GET /sequoia_member_exps/new
  def new
    @sequoia_member_exp = SequoiaMemberExp.new
  end

  # GET /sequoia_member_exps/1/edit
  def edit
  end

  # POST /sequoia_member_exps or /sequoia_member_exps.json
  def create
    @sequoia_member_exp = SequoiaMemberExp.new(sequoia_member_exp_params)

    respond_to do |format|
      if @sequoia_member_exp.save
        format.html { redirect_to @sequoia_member_exp, notice: "Sequoia member exp was successfully created." }
        format.json { render :show, status: :created, location: @sequoia_member_exp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sequoia_member_exp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequoia_member_exps/1 or /sequoia_member_exps/1.json
  def update
    respond_to do |format|
      if @sequoia_member_exp.update(sequoia_member_exp_params)
        format.html { redirect_to @sequoia_member_exp, notice: "Sequoia member exp was successfully updated." }
        format.json { render :show, status: :ok, location: @sequoia_member_exp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sequoia_member_exp.errors, status: :unprocessable_entity }
      end
    end
  end

  def import #Uploading CSV function
    SequoiaMemberExp.my_import(params[:file])
    redirect_to sequoia_member_exps_path, notice: "Upload Complete"
  end

  # DELETE /sequoia_member_exps/1 or /sequoia_member_exps/1.json
  def destroy
    @sequoia_member_exp.destroy
    respond_to do |format|
      format.html { redirect_to sequoia_member_exps_url, notice: "Sequoia member exp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequoia_member_exp
      @sequoia_member_exp = SequoiaMemberExp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sequoia_member_exp_params
      params.require(:sequoia_member_exp).permit(:uid, :membership, :last_membership, :membership_exp)
    end
end
