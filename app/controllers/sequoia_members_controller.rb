class SequoiaMembersController < ApplicationController
  before_action :set_sequoia_member, only: %i[ show edit update destroy ]

  # GET /sequoia_members or /sequoia_members.json
  def index
    @sequoia_members = SequoiaMember.all

    @order_id = (IdNumberStorage.pluck(:sequoia_members_order_id))[0]

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      SequoiaMember.delete_all
      redirect_to sequoia_members_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @sequoia_members.to_csv, filename: "Sequoia-Members-#{Date.today}.csv" }
    end

  end

  def run_update
    # ADD JUST NEW PEOPLE (UID)
    @order_id = (IdNumberStorage.pluck(:sequoia_members_order_id))[0]
    uid = SequoiaMember.pluck(:uid)

      SequoiaCustomer.where('order_id > ?', @order_id).where.not(uid: uid).order(id: :ASC).all.each do |i|
        SequoiaMember.create(uid: i.uid, lname: i.lname, first_purchase: i.purchase, last_purchase: i.purchase, cpa: false, cpa_memberships: 0, ea: false, ea_memberships: 0, ethics: false, ethics_purchases: 0, afsp: false, afsp_purchases: 0, other: 0).save
      end
      redirect_to sequoia_members_path(), notice: 'Member Update Complete'
  end

  def run_update_2
    @order_id = (IdNumberStorage.pluck(:sequoia_members_order_id))[0]

    if params['run'].present?

      cpa_membership = SequoiaProductList.where(who: 'cpa').where(group: 'membership').pluck(:product)
      ea_membership = SequoiaProductList.where(who: 'ea').where(group: 'membership').pluck(:product)
      afsp = SequoiaProductList.where(who: 'afsp').pluck(:product)
      ethics = SequoiaProductList.where(group: 'ethics').pluck(:product)
      other = SequoiaProductList.where(group: 'upgrade').pluck(:product)

      SequoiaCustomer.order(order_id: :asc).where('order_id > ?', @order_id).each do |i|
        member = SequoiaMember.find_by(uid: i.uid)

      #UPDATEING INFO ON THEIR Sequoia Member Record
        if member.present?
          if cpa_membership.include? i.product_1
            SequoiaMember.where(uid: i.uid).update_all cpa: true, cpa_memberships: (member.cpa_memberships + 1), last_purchase: i.purchase
          elsif ea_membership.include? i.product_1
            SequoiaMember.where(uid: i.uid).update_all ea: true, ea_memberships: (member.ea_memberships + 1), last_purchase: i.purchase
          elsif afsp.include? i.product_1
            SequoiaMember.where(uid: i.uid).update_all afsp: true, afsp_purchases: (member.afsp_purchases + 1), last_purchase: i.purchase
          elsif other.include? i.product_1
            SequoiaMember.where(uid: i.uid).update_all other: (member.other + 1), last_purchase: i.purchase
          end

          if ethics.include? i.product_1
            SequoiaMember.where(uid: i.uid).update_all ethics: true, ethics_purchases: (member.ethics_purchases + 1), last_purchase: i.purchase
          end

          if ethics.include? i.product_2
            SequoiaMember.where(uid: i.uid).update_all ethics: true, ethics_purchases: (member.ethics_purchases + 1), last_purchase: i.purchase
          end

      # Updating EXP Date
        # If new purchase order is (membership only) happens when exp is still active then add 1.year to the exp. If membership purchase is after exp then 1.year from that purchase.
          if (ea_membership + cpa_membership).include? i.product_1
            if member.membership_exp.blank?
              SequoiaMember.where(uid: member.uid).update_all membership_exp: i.purchase + 1.year, discount_exp: i.purchase + 379.days
            elsif member.membership_exp <= i.purchase
              SequoiaMember.where(uid: member.uid).update_all membership_exp: i.purchase + 1.year, discount_exp: i.purchase + 379.days
            elsif member.membership_exp > i.purchase
              SequoiaMember.where(uid: member.uid).update_all membership_exp: member.membership_exp + 1.year, discount_exp: member.discount_exp + 1.year
            end
          end

        #UPDATE NUMBER STORAGE FIELD SO NEXT TIME IT IS RUN IT STARTS ON ONLY NEW RECORDS
          IdNumberStorage.update_all sequoia_members_order_id: i.order_id
        end

        ## FIX TEXAS ETHICS ISSUE -
        SequoiaCustomer.where(product_1: 'XX').update_all product_1: '9245 - A CPAs Guidebook to Ethical Behavior: A CPE Ethics Course for Texas CPAs'
        SequoiaCustomer.where(product_2: 'XX').update_all product_2: '9245 - A CPAs Guidebook to Ethical Behavior: A CPE Ethics Course for Texas CPAs'
      end

      redirect_to sequoia_members_path(), notice: 'EXP/Purchase Update Complete'
    end


  end
  # GET /sequoia_members/1 or /sequoia_members/1.json
  def show
  end

  # GET /sequoia_members/new
  def new
    @sequoia_member = SequoiaMember.new
  end

  # GET /sequoia_members/1/edit
  def edit
  end

  # POST /sequoia_members or /sequoia_members.json
  def create
    @sequoia_member = SequoiaMember.new(sequoia_member_params)

    respond_to do |format|
      if @sequoia_member.save
        format.html { redirect_to @sequoia_member, notice: "Sequoia member was successfully created." }
        format.json { render :show, status: :created, location: @sequoia_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sequoia_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequoia_members/1 or /sequoia_members/1.json
  def update
    respond_to do |format|
      if @sequoia_member.update(sequoia_member_params)
        format.html { redirect_to @sequoia_member, notice: "Sequoia member was successfully updated." }
        format.json { render :show, status: :ok, location: @sequoia_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sequoia_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequoia_members/1 or /sequoia_members/1.json
  def destroy
    @sequoia_member.destroy
    respond_to do |format|
      format.html { redirect_to sequoia_members_url, notice: "Sequoia member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    SequoiaMember.my_import(params[:file])
    redirect_to sequoia_members_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequoia_member
      @sequoia_member = SequoiaMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sequoia_member_params
      params.require(:sequoia_member).permit(:uid, :lname, :first_purchase, :last_purchase, :cpa, :cpa_memberships, :ea, :ea_memberships, :afsp, :afsp_purchases, :ethics, :ethics_purchases, :other, :membership_exp, :discount_exp)
    end
end
