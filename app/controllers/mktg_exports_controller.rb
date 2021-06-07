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

    if params['campaign'].present? && params['range_1_date_1'].present?
      MktgExport.delete_all

      @dates = [].uniq
      #Input box dates
      r1d1 = params['range_1_date_1'].to_date
      r1d2 = params['range_1_date_2'].to_date
      r2d1 = params['range_2_date_1'].to_date
      r2d2 = params['range_2_date_2'].to_date
      # Dealing with blank input boxes
      if r1d2.blank?
        r1d2 = r1d1
      end
      if r2d1.blank?
        r2d1 = r1d1
        r2d2 = r1d1
      elsif r2d2.blank?
        r2d2 = r2d1
      end
      # Push dates into @dates Array
      (r1d1..r1d2).each do |i| @dates.push(i) end
      (r2d1.to_date..r2d2).each do |i| @dates.push(i) end

      if params['co'] == 'sequoia'
        sequoia
      elsif params['co'] == 'empire'
        empire
      end

    end
  end

  def sequoia
    if params['campaign'] == 'Return Customer' #CREATE the record just with UID
      SequoiaMemberExp.where(membership_exp: @dates).where(membership: params['des']).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.membership_exp, campaign: 'Return Customer', des: params['des'])
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

    MktgExport.all.each do |i| #Add the remaining customer infomation
      customer_data = SequoiaCustomer.find_by(uid: i.uid)
      MktgExport.where(uid: i.uid).update_all email: customer_data.email, fname: customer_data.fname, lname: (customer_data.lname), street_1: customer_data.street_1, street_2: customer_data.street_2, city: customer_data.city, state: customer_data.state, zip: customer_data.zip
    end

    #Add the Marketing TEXT (do with a table in the future?)
    if params['campaign'] == 'Return Customer' && params['des'] == 'cpa'
      MktgExport.update_all text_1: 'Membership Expires',text_2: '',text_3: ''
    elsif params['campaign'] == 'Return Customer' && params['des'] == 'ea'
      MktgExport.update_all text_1: 'Membership Expires',text_2: '',text_3: ''
    elsif params['campaign'] == 'New Customer' && params['des'] == 'cpa'
      MktgExport.update_all text_1: 'NC_CPA_Text_1',text_2: 'NC_CPA_Text_2',text_3: 'NC_CPA_Text_3'
    elsif params['campaign'] == 'New Customer' && params['des'] == 'ea'
      MktgExport.update_all text_1: 'NC_EA_Text_1',text_2: 'NC_EA_Text_2',text_3: 'NC_EA_Text_3'
    end
  end
  def empire
    if params['campaign'] == 'New Customer'
      EmpireMember.where(first_purchase: @dates).where(state: params['empire_st'].upcase).all.each do |i|
        MktgExport.create(uid: i.uid, exp: i.first_purchase, campaign: params['campaign'], des: i.state).save
      end
    end

    if params['campaign'] == 'Return Customer'
      EmpireMasterMatch.where(exp: @dates).where(lic_st: params['empire_st'].upcase).all.each do |i|
        member = EmpireMember.find_by(uid: i.uid)
        if member.last_purchase < Date.today - 18.months
          MktgExport.create(uid: i.uid, exp: i.exp, campaign: params['campaign'], des: i.lic_st).save
        end
      end
    end


    MktgExport.all.each do |i| #Add the remaining customer infomation
      customer_data = EmpireCustomer.find_by(uid: i.uid)
      MktgExport.where(uid: i.uid).update_all email: customer_data.email, fname: customer_data.fname, lname: (customer_data.lname), street_1: customer_data.street_1, street_2: customer_data.street_2, city: customer_data.city, state: customer_data.state, zip: customer_data.zip
    end
    MktgExport.update_all text_1: '22.5-Hour New York CE Package',text_2: '$59.99',text_3: 'Take an additional 10% off - Use Code:', text_4: 'ReturningStudent21'
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
    SequoiaCustomer.my_import(params[:file])
    redirect_to sequoia_customers_path, notice: "Upload Complete"
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
