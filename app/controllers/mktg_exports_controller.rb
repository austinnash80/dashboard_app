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
    end

    if params['campaign'].present? && params['range_1_date_1'].present?
      MktgExport.delete_all

      dates ## FIND THE DESIRED EXP DATES AND SEGEMENTS AND PUTS THEM IN AN ARRAY

      if params['co'] == 'Sequoia'
        sequoia
      elsif params['co'] == 'Empire'
        empire
      end

    end

  end

  def dates
    @dates = [].uniq
    ##FOR EMAIL SEGMENTS - > SEPERATE DATE RANGES
      @seg_1 = [].uniq
      @seg_2 = [].uniq
      @seg_3 = [].uniq
      @seg_4 = [].uniq
      @seg_5 = [].uniq
      @seg_6 = [].uniq
      @seg_7 = [].uniq
      @seg_8 = [].uniq
      @seg_9 = [].uniq
      @seg_10 = [].uniq
      @seg_11 = [].uniq
    ## END SEGEMENTS

    #Date Ranges in Params
    r1d1 = params['range_1_date_1'].present? ? params['range_1_date_1'].to_date : ''
    r1d2 = params['range_1_date_2'].present? ? params['range_1_date_2'].to_date : ''
    r2d1 = params['range_2_date_1'].present? ? params['range_2_date_1'].to_date : ''
    r2d2 = params['range_2_date_2'].present? ? params['range_2_date_2'].to_date : ''
    r3d1 = params['range_3_date_1'].present? ? params['range_3_date_1'].to_date : ''
    r3d2 = params['range_3_date_2'].present? ? params['range_3_date_2'].to_date : ''
    r4d1 = params['range_4_date_1'].present? ? params['range_4_date_1'].to_date : ''
    r4d2 = params['range_4_date_2'].present? ? params['range_4_date_2'].to_date : ''
    r5d1 = params['range_5_date_1'].present? ? params['range_5_date_1'].to_date : ''
    r5d2 = params['range_5_date_2'].present? ? params['range_5_date_2'].to_date : ''
    r6d1 = params['range_6_date_1'].present? ? params['range_6_date_1'].to_date : ''
    r6d2 = params['range_6_date_2'].present? ? params['range_6_date_2'].to_date : ''
    r7d1 = params['range_7_date_1'].present? ? params['range_7_date_1'].to_date : ''
    r7d2 = params['range_7_date_2'].present? ? params['range_7_date_2'].to_date : ''
    r8d1 = params['range_8_date_1'].present? ? params['range_8_date_1'].to_date : ''
    r8d2 = params['range_8_date_2'].present? ? params['range_8_date_2'].to_date : ''
    r9d1 = params['range_9_date_1'].present? ? params['range_9_date_1'].to_date : ''
    r9d2 = params['range_9_date_2'].present? ? params['range_9_date_2'].to_date : ''
    r10d1 = params['range_10_date_1'].present? ? params['range_10_date_1'].to_date : ''
    r10d2 = params['range_10_date_2'].present? ? params['range_10_date_2'].to_date : ''
    r11d1 = params['range_11_date_1'].present? ? params['range_11_date_1'].to_date : ''
    r11d2 = params['range_11_date_2'].present? ? params['range_11_date_2'].to_date : ''
    # Dealing with blank input boxes
    # if r1d2.blank?
    #   r1d2 = r1d1
    # end

    ## APPEND DATES WANTED INTO ARRAYS
    if r1d1.present? && r1d2.present?
      (r1d1..r1d2).each do |i| @dates.push(i) end
      (r1d1..r1d2).each do |i| @seg_1.push(i) end
    end
    if r2d1.present? && r2d2.present?
      (r2d1.to_date..r2d2).each do |i| @dates.push(i) end
      (r2d1.to_date..r2d2).each do |i| @seg_2.push(i) end
    end
    if r3d1.present? && r3d2.present?
      (r3d1.to_date..r3d2).each do |i| @dates.push(i) end
      (r3d1.to_date..r3d2).each do |i| @seg_3.push(i) end
    end
    if r4d1.present? && r4d2.present?
      (r4d1.to_date..r4d2).each do |i| @dates.push(i) end
      (r4d1.to_date..r4d2).each do |i| @seg_4.push(i) end
    end
    if r5d1.present? && r5d2.present?
      (r5d1.to_date..r5d2).each do |i| @dates.push(i) end
      (r5d1.to_date..r5d2).each do |i| @seg_5.push(i) end
    end
    if r6d1.present? && r6d2.present?
      (r6d1.to_date..r6d2).each do |i| @dates.push(i) end
      (r6d1.to_date..r6d2).each do |i| @seg_6.push(i) end
    end
    if r7d1.present? && r7d2.present?
      (r7d1.to_date..r7d2).each do |i| @dates.push(i) end
      (r7d1.to_date..r7d2).each do |i| @seg_7.push(i) end
    end
    if r8d1.present? && r8d2.present?
      (r8d1.to_date..r8d2).each do |i| @dates.push(i) end
      (r8d1.to_date..r8d2).each do |i| @seg_8.push(i) end
    end
    if r9d1.present? && r9d2.present?
      (r9d1.to_date..r9d2).each do |i| @dates.push(i) end
      (r9d1.to_date..r9d2).each do |i| @seg_9.push(i) end
    end
    if r10d1.present? && r10d2.present?
      (r10d1.to_date..r10d2).each do |i| @dates.push(i) end
      (r10d1.to_date..r10d2).each do |i| @seg_10.push(i) end
    end
    if r11d1.present? && r11d2.present?
      (r11d1.to_date..r11d2).each do |i| @dates.push(i) end
      (r11d1.to_date..r11d2).each do |i| @seg_11.push(i) end
    end
  end

  def sequoia
    active_auto_renew = AutoRenewList.pluck(:uid)
    if params['campaign'] == 'Return' && params['des'] == 'CPA'#CREATE the record just with UID
      SequoiaMember.where(membership_exp: @dates).where(cpa: true).where.not(uid: active_auto_renew).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.membership_exp, campaign: 'Return', des: 'CPA')
      end
    elsif params['campaign'] == 'Return' && params['des'] == 'EA'#CREATE the record just with UID
      SequoiaMember.where(membership_exp: @dates).where(ea: true).where.not(uid: active_auto_renew).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.membership_exp, campaign: 'Return', des: 'EA')
      end
    elsif params['campaign'] == 'New' && params['des'] == 'CPA'
      SequoiaMember.where(first_purchase: @dates).where(cpa: true).where(cpa_memberships: 1).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.first_purchase, campaign: 'New', des: params['des'])
      end
    elsif params['campaign'] == 'New' && params['des'] == 'EA'
      SequoiaMember.where(first_purchase: @dates).where(ea: true).where(ea_memberships: 1).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.first_purchase, campaign: 'New', des: params['des'])
      end
      ### Sequoia Email
    elsif params['campaign'] == 'Return' && params['delivery_type'] == 'Email'
      SequoiaMember.where(membership_exp: @dates).where.not(uid: active_auto_renew).all.each do |i|
        i.cpa == true ? des = 'CPA' : i.ea == true ? des = 'EA' : ''
        if des.present?
          MktgExport.create(uid: i.uid, exp: i.membership_exp, campaign: 'Return', des: des)
        end
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
    if params['campaign'] == 'Return' && params['des'] == 'CPA'
      MktgExport.update_all text_1: 'Membership Expires',text_2: '',text_3: ''
    elsif params['campaign'] == 'Return' && params['des'] == 'EA'
      MktgExport.update_all text_1: 'Membership Expires',text_2: '',text_3: ''
    elsif params['campaign'] == 'New' && params['des'] == 'CPA'
      MktgExport.update_all text_1: 'Membership Valid Through',text_2: '',text_3: ''
    elsif params['campaign'] == 'New' && params['des'] == 'EA'
      MktgExport.update_all text_1: 'Membership Valid Through',text_2: '',text_3: ''
    end

    if params['campaign'] == 'Return' && params['delivery_type'] == 'Email'
      MktgExport.where(des: 'CPA').update_all text_1: 'CPE', text_2: '15%', text_3: '$126.50'
      MktgExport.where(des: 'EA').update_all text_1: 'CE', text_2: '10%', text_3: '$89'
      MktgExport.where(exp: @seg_1).update_all text_10: '1'
      MktgExport.where(exp: @seg_2).update_all text_10: '2'
      MktgExport.where(exp: @seg_3).update_all text_10: '3'
      MktgExport.where(exp: @seg_4).update_all text_10: '4'
    end

    IdNumberStorage.where(id: 1).update_all campaign_id: params['id']
    redirect_to mktg_exports_path(id: params['id'])
  end

  def empire
    if params['campaign'] == 'Return' && params['empire_st'] == 'Rolling'
      rolling_state = ['CA','NY','GA','NM','TN','TX','UT','WA', 'MO', 'PA', 'IN', 'NC', 'NJ', 'SC'] #Last Updated June 2022
      models = []
      rolling_state.each do |state|
        models.push("EmpireMaster#{state.titlecase}Match")
      end

      models.each do |model|
        model.constantize.where(exp: @dates).all.each do |i|
          MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.st).save
        end
      end
      MktgExport.all.each do |i|
        member = EmpireMember.find_by(uid: i.uid)
        customer = EmpireCustomer.order(purchase: :DESC).find_by(uid: i.uid)
        recent_purchase_exclude = Date.today - 12.months
        if member.blank? || customer.blank?
          MktgExport.where(id: i.id).delete_all
        elsif member.last_purchase > recent_purchase_exclude
          MktgExport.where(id: i.id).delete_all
        else
          MktgExport.where(id: i.id).update_all email: customer.email, fname: customer.fname, lname: customer.lname, street_1: customer.street_1, street_2: customer.street_2, city: customer.city, state: customer.state, zip: customer.zip
        end
      end

    elsif params['campaign'] == 'Return' && params['des'] == 'PA'
      EmpireMasterPaMatch.where(exp: @dates).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.st).save
      end
      MktgExport.all.each do |i|
        member = EmpireMember.find_by(uid: i.uid)
        customer = EmpireCustomer.order(purchase: :DESC).find_by(uid: i.uid)
        recent_purchase_exclude = Date.today - 12.months
        if member.blank? || customer.blank?
          MktgExport.where(id: i.id).delete_all
        elsif member.last_purchase > recent_purchase_exclude
          MktgExport.where(id: i.id).delete_all
        else
          MktgExport.where(id: i.id).update_all email: customer.email, fname: customer.fname, lname: customer.lname, street_1: customer.street_1, street_2: customer.street_2, city: customer.city, state: customer.state, zip: customer.zip
        end
      end
    elsif params['campaign'] == 'Return' && params['des'] == 'MO_B'
      EmpireMasterMoMatch.where(exp: @dates).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.st).save
      end
      MktgExport.all.each do |i|
        member = EmpireMember.find_by(uid: i.uid)
        customer = EmpireCustomer.order(purchase: :DESC).find_by(uid: i.uid)
        recent_purchase_exclude = Date.today - 12.months
        if member.blank? || customer.blank?
          MktgExport.where(id: i.id).delete_all
        elsif member.last_purchase > recent_purchase_exclude
          MktgExport.where(id: i.id).delete_all
        else
          MktgExport.where(id: i.id).update_all email: customer.email, fname: customer.fname, lname: customer.lname, street_1: customer.street_1, street_2: customer.street_2, city: customer.city, state: customer.state, zip: customer.zip
        end
      end
    end

      # end
      # if params['empire_st'] == 'Rolling'
      #   states = ['CA', 'NY']
      # else
      #   states = params['empire_st']
      #   model = "EmpireMaster#{params['empire_st'].titlecase}Match".constantize
      # end

      # # model.where(exp: @dates).all.each do |i|
      # EmpireMasterPaMatch.all.each do |i|
      #   member = EmpireMember.find_by(uid: i.uid)
      #   MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.st).save
      # end


      # EmpireMasterMatch.where(exp: @dates).where(lic_st: states).all.each do |i|
      #   member = EmpireMember.find_by(uid: i.uid)
      #   if member.state == 'NY' && member.last_purchase < Date.today - 18.months
      #     MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.lic_st).save
      #   elsif member.state == 'CA' && member.last_purchase < Date.today - 36.months
      #     MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.lic_st).save
      #   end
      # end


    ## RELOAD THE PAGE HERE TO AVOID TIMING OUT

    ##### NEW MEXICO DIRECT MAIL - INHOUSE PROSPECTIVE CUSTOMERS
    # if params['campaign'] == 'Nm Direct'
    #   states = params['empire_st'].upcase.split()
    #   customer_lic_number = EmpireCustomer.where(lic_state: 'NM').pluck(:lic_num)
    #
    #   EmpireMasterNmList.where(exp_date: @dates).where.not(lic: customer_lic_number).where.not(bad: true).all.each do |i|
    #     MktgExport.create(uid: i.lid, exp: i.exp_date, campaign: params['campaign'], des: i.lic_state, fname: i.fname, lname: i.lname, street_1: i.add, street_2: i.add2, city: i.city, state: i.st, zip: i.zip).save
    #   end
    # end
    #Add the remaining customer infomation

    # ADD Additonal TEXT FOR PRINT and EMAIL
    if params['delivery_type'].present? && params['delivery_type'] == 'Postcard'
      MktgExport.where(des: 'NY').update_all text_1: '22.5-Hour New York CE Package',text_2: '$59.99'
      MktgExport.where(des: 'CA').update_all text_1: '45-Hour California CE Package',text_2: '$47.99'
    elsif params['delivery_type'].present? && params['delivery_type'] == 'Email'
      MktgExport.where(des: 'CA').update_all text_1: 'CA 45hr packages', text_2: '$47.99'
      MktgExport.where(des: 'GA').update_all text_1: 'GA 36hr packages', text_2:  '$97.99'
      MktgExport.where(des: 'NM').update_all text_1: 'NM 24hr packages', text_2: '$146.99'
      MktgExport.where(des: 'NY').update_all text_1: 'NY 22.5hr packages', text_2: '$59.99'
      MktgExport.where(des: 'TN').update_all text_1: 'TN 16hr packages', text_2: '$69.99'
      MktgExport.where(des: 'TX').update_all text_1: 'TX 22.5hr packages', text_2: '$59.99'
      MktgExport.where(des: 'UT').update_all text_1: 'UT 9hr packages', text_2: '$59.50'
      MktgExport.where(des: 'WA').update_all text_1: 'WA 30hr packages', text_2: '$89.99'
      MktgExport.where(des: 'PA').update_all text_1: 'PA 14hr packages', text_2: '$69.99'
      MktgExport.where(des: 'MO').update_all text_1: 'MO 12hr packages', text_2: '$58.50'
      MktgExport.where(des: 'MO_B').update_all text_1: 'MO 12hr packages', text_2: '$58.50'
      MktgExport.where(des: 'MO_S').update_all text_1: 'MO 12hr packages', text_2: '$58.50'
      MktgExport.where(des: 'IND').update_all text_1: 'IN 12hr packages', text_2: '$48.99'
      MktgExport.where(des: 'IND').update_all text_1: 'IN 12hr packages', text_2: '$48.99'
      MktgExport.where(des: 'NC').update_all text_1: 'NC 4hr packages', text_2: '$39.50'
      MktgExport.where(des: 'NJ').update_all text_1: 'NJ 12hr packages', text_2: '$52.49'
      MktgExport.where(des: 'SC').update_all text_1: 'SC 10hr packages', text_2: '$59.49'
      MktgExport.where(des: 'VA').update_all text_1: 'VA 8hr packages', text_2: ''
      ## ADDING SEGMENTS BASED ON EXP DATE - > DETERMINES WITCH EMAIL THEY WILL RECIEVE
      MktgExport.where(exp: @seg_1).update_all text_10: '1'
      MktgExport.where(exp: @seg_2).update_all text_10: '2'
      MktgExport.where(exp: @seg_3).update_all text_10: '3'
      MktgExport.where(exp: @seg_4).update_all text_10: '4'
      MktgExport.where(exp: @seg_5).update_all text_10: '5'
      MktgExport.where(exp: @seg_6).update_all text_10: '6'
      MktgExport.where(exp: @seg_7).update_all text_10: '7'
      MktgExport.where(exp: @seg_8).update_all text_10: '8'
      MktgExport.where(exp: @seg_9).update_all text_10: '9'
      MktgExport.where(exp: @seg_10).update_all text_10: '10'
      MktgExport.where(exp: @seg_11).update_all text_10: '11'
      #REMOVE ANYONE WHO DOES NOT HAVE AN EMAIL ADDRESS (CA Has Old ones without emails)
      MktgExport.where(email: 'null').delete_all
    end
    IdNumberStorage.where(id: 1).update_all campaign_id: params['id']
    redirect_to mktg_exports_path(id: params['id'])
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
