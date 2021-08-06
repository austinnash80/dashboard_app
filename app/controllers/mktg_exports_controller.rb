class MktgExportsController < ApplicationController
  before_action :set_mktg_export, only: %i[ show edit update destroy ]

  # GET /mktg_exports or /mktg_exports.json
  def index
    @mktg_exports = MktgExport.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MktgExport.delete_all
      redirect_to mktg_exports_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @mktg_exports.to_csv, filename: "Mktg_Export-#{Date.today}.csv" }
    end

    if params['delete'] == 'yes'
      MktgExport.delete_all
      if params['co'] == 'empire'
        redirect_to mktg_exports_path(co: 'empire')
      elsif params['co'] == 'sequoia'
        redirect_to mktg_exports_path(co: 'sequoia')
      end
    end

    # buttons
    params['campaign'] == 'Return Customer' && params['co'] == 'sequoia' && params['des'] == 'cpa'? @sequoia_rc_cpa = 'btn-secondary' : @sequoia_rc_cpa = 'btn-primary'
    params['campaign'] == 'Return Customer' && params['co'] == 'sequoia' && params['des'] == 'ea'? @sequoia_rc_ea = 'btn-secondary' : @sequoia_rc_ea = 'btn-primary'
    params['campaign'] == 'New Customer' && params['co'] == 'sequoia' && params['des'] == 'cpa'? @sequoia_nc_cpa = 'btn-secondary' : @sequoia_nc_cpa = 'btn-primary'
    params['campaign'] == 'New Customer' && params['co'] == 'sequoia' && params['des'] == 'ea'? @sequoia_nc_ea = 'btn-secondary' : @sequoia_nc_ea = 'btn-primary'

    params['campaign'] == 'Return Customer' && params['co'] == 'empire' ? @empire_rc = 'btn-secondary' : @empire_rc = 'btn-primary'
    params['campaign'] == 'New Customer' && params['co'] == 'empire' ? @empire_nc = 'btn-secondary' : @empire_nc = 'btn-primary'

    if params['campaign'].present? && params['range_1_date_1'].present?
      MktgExport.delete_all

      @dates = [].uniq
      #Input box dates
      r1d1 = params['range_1_date_1'].present? ? params['range_1_date_1'].to_date : ''
      r1d2 = params['range_1_date_2'].present? ? params['range_1_date_2'].to_date : ''
      r2d1 = params['range_2_date_1'].present? ? params['range_2_date_1'].to_date : ''
      r2d2 = params['range_2_date_2'].present? ? params['range_2_date_2'].to_date : ''
      r3d1 = params['range_3_date_1'].present? ? params['range_3_date_1'].to_date : ''
      r3d2 = params['range_3_date_2'].present? ? params['range_3_date_2'].to_date : ''
      # Dealing with blank input boxes
      if r1d2.blank?
        r1d2 = r1d1
      end
      # if r2d1.blank?
      #   r2d1 = r1d1
      #   r2d2 = r1d1
      # elsif r2d2.blank?
      #   r2d2 = r2d1
      # end
      # Push dates into @dates Array
      if r1d1.present? && r1d2.present?
        (r1d1..r1d2).each do |i| @dates.push(i) end
      end
      if r2d1.present? && r2d2.present?
        (r2d1.to_date..r2d2).each do |i| @dates.push(i) end
      end
      if r3d1.present? && r3d2.present?
        (r3d1.to_date..r3d2).each do |i| @dates.push(i) end
      end

      if params['co'] == 'sequoia'
        sequoia
      elsif params['co'] == 'empire'
        empire
      end

    end
  end

  def sequoia
    active_auto_renew = AutoRenewList.pluck(:uid)
    if params['campaign'] == 'Return Customer' && params['des'] == 'cpa'#CREATE the record just with UID
      SequoiaMember.where(membership_exp: @dates).where(cpa: true).where.not(uid: active_auto_renew).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.membership_exp, campaign: 'Return Customer', des: 'cpa')
      end
    elsif params['campaign'] == 'Return Customer' && params['des'] == 'ea'#CREATE the record just with UID
      SequoiaMember.where(membership_exp: @dates).where(ea: true).where.not(uid: active_auto_renew).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.membership_exp, campaign: 'Return Customer', des: 'ea')
      end
    elsif params['campaign'] == 'New Customer' && params['des'] == 'cpa'
      SequoiaMember.where(first_purchase: @dates).where(cpa: true).where(cpa_memberships: 1).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.first_purchase, campaign: 'New Customer', des: params['des'])
      end
    elsif params['campaign'] == 'New Customer' && params['des'] == 'ea'
      SequoiaMember.where(first_purchase: @dates).where(ea: true).where(ea_memberships: 1).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.first_purchase, campaign: 'New Customer', des: params['des'])
      end
    end

    #Add the remaining customer infomation, USE NCOA WHEN AVAILIABLE
    MktgExport.all.each do |i|
      ncoa_customer_data = SequoiaNcoa.find_by(uid: i.uid)
      customer_data = SequoiaCustomer.find_by(uid: i.uid)
      if ncoa_customer_data.present?
        unless ncoa_customer_data.bad?
          MktgExport.where(uid: i.uid).update_all fname: ncoa_customer_data.fname, lname: ncoa_customer_data.lname, street_1: ncoa_customer_data.street_1, street_2: ncoa_customer_data.street_2, city: ncoa_customer_data.city, state: ncoa_customer_data.state, zip: ncoa_customer_data.zip
          MktgExport.where(uid: i.uid).update_all email: customer_data.email
        end
      else
        MktgExport.where(uid: i.uid).update_all email: customer_data.email,  fname: customer_data.fname, lname: (customer_data.lname), street_1: customer_data.street_1, street_2: customer_data.street_2, city: customer_data.city, state: customer_data.state, zip: customer_data.zip
      end
        MktgExport.where(uid: i.uid).where(zip: nil).delete_all ##DELETE RECORDS THAT DID HOT NCOA OR HAVE full address
    end

    #Add the Marketing TEXT (do with a table in the future?)
    if params['campaign'] == 'Return Customer' && params['des'] == 'cpa'
      MktgExport.update_all text_1: 'Membership Expires',text_2: '',text_3: ''
    elsif params['campaign'] == 'Return Customer' && params['des'] == 'ea'
      MktgExport.update_all text_1: 'Membership Expires',text_2: '',text_3: ''
    elsif params['campaign'] == 'New Customer' && params['des'] == 'cpa'
      MktgExport.update_all text_1: 'Membership Valid Through',text_2: '',text_3: ''
    elsif params['campaign'] == 'New Customer' && params['des'] == 'ea'
      MktgExport.update_all text_1: 'Membership Valid Through',text_2: '',text_3: ''
    end
  end

  def empire
    ##### EMPIRE NC (IF NEEDED IN FUTURE)
    # if params['campaign'] == 'New Customer'
    #   states = params['empire_st'].upcase.split()
    #   EmpireMember.where(first_purchase: @dates).where(state: states).all.each do |i|
    #     MktgExport.create(uid: i.uid, exp: i.first_purchase, campaign: params['campaign'], des: i.state).save
    #   end
    # end
    ##### EMPIRE RC
    if params['campaign'] == 'Return Customer' ##### EMPIRE RC
      states = params['empire_st'].upcase.split()
      EmpireMasterMatch.where(exp: @dates).where(lic_st: states).all.each do |i|
        member = EmpireMember.find_by(uid: i.uid)
        if member.state == 'NY' && member.last_purchase < Date.today - 18.months
          MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.lic_st).save
        elsif member.state == 'CA' && member.last_purchase < Date.today - 36.months
          MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.lic_st).save
        end
      end
    end

    ##### NEW MEXICO DIRECT MAIL - INHOUSE PROSPECTIVE CUSTOMERS
    if params['campaign'] == 'Nm Direct'
      states = params['empire_st'].upcase.split()
      customer_lic_number = EmpireCustomer.where(lic_state: 'NM').pluck(:lic_num)

      EmpireMasterNmList.where(exp_date: @dates).where.not(lic: customer_lic_number).where.not(bad: true).all.each do |i|
        MktgExport.create(uid: i.lid, exp: i.exp_date, campaign: params['campaign'], des: i.lic_state, fname: i.fname, lname: i.lname, street_1: i.add, street_2: i.add2, city: i.city, state: i.st, zip: i.zip).save
      end
    end
    #Add the remaining customer infomation
    if params['campaign'] == 'Return Customer'
      MktgExport.all.each do |i| #Add the remaining customer infomation
        customer_data = EmpireCustomer.order(purchase: :DESC).find_by(uid: i.uid)
        MktgExport.where(uid: i.uid).update_all email: customer_data.email, fname: customer_data.fname, lname: (customer_data.lname), street_1: customer_data.street_1, street_2: customer_data.street_2, city: customer_data.city, state: customer_data.state, zip: customer_data.zip
      end
    end
    # ADD TEXT FOR PRINT
    if params['delivery_type'].present? && params['delivery_type'].upcase == 'postcard'.upcase
      MktgExport.where(des: 'NY').update_all text_1: '22.5-Hour New York CE Package',text_2: '$59.99',text_3: 'Take an additional 10% off - Use Code:', text_4: 'ReturningStudent21'
      MktgExport.where(des: 'CA').update_all text_1: '45-Hour California CE Package',text_2: '$47.99',text_3: 'Take an additional 10% off - Use Code:', text_4: 'ReturningStudent21'
    elsif params['delivery_type'].present? && params['delivery_type'].upcase == 'email'.upcase
      MktgExport.where(des: 'NY').update_all text_1: 'NY 22.5hr packages only $59.99'
      MktgExport.where(des: 'CA').update_all text_1: 'CA 45hr packages only $47.99'
    end

    ## FOR EMAIL - REMOVE ANYONE WHO DOES NOT HAVE AN EMAIL ADDRESS (CA Has Old one without emails)
    if params['delivery_type'].present? && params['delivery_type'].upcase == 'email'.upcase
      MktgExport.where(email: nil).delete_all
    end

  end

  def print
  end

  # GET /mktg_exports/1 or /mktg_exports/1.json
  def show
  end

  # GET /mktg_exports/new
  def new
    @mktg_export = MktgExport.new
  end

  # GET /mktg_exports/1/edit
  def edit
  end

  # POST /mktg_exports or /mktg_exports.json
  def create
    @mktg_export = MktgExport.new(mktg_export_params)

    respond_to do |format|
      if @mktg_export.save
        format.html { redirect_to @mktg_export, notice: "Mktg export was successfully created." }
        format.json { render :show, status: :created, location: @mktg_export }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mktg_export.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mktg_exports/1 or /mktg_exports/1.json
  def update
    respond_to do |format|
      if @mktg_export.update(mktg_export_params)
        format.html { redirect_to @mktg_export, notice: "Mktg export was successfully updated." }
        format.json { render :show, status: :ok, location: @mktg_export }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mktg_export.errors, status: :unprocessable_entity }
      end
    end
  end

  def import #Uploading CSV function
    MktgExport.my_import(params[:file])
    redirect_to mktg_exports_path, notice: "Upload Complete"
  end


  # DELETE /mktg_exports/1 or /mktg_exports/1.json
  def destroy
    @mktg_export.destroy
    respond_to do |format|
      format.html { redirect_to mktg_exports_url, notice: "Mktg export was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mktg_export
      @mktg_export = MktgExport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mktg_export_params
      params.require(:mktg_export).permit(:uid, :campaign, :des, :exp, :fname, :lname, :street_1, :street_2, :city, :state, :zip, :email, :text_1, :text_2, :text_3, :text_4, :text_5, :text_6, :text_7, :text_8, :text_9, :text_10)
    end
end
