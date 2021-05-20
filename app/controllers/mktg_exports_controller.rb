class MktgExportsController < ApplicationController
  before_action :set_mktg_export, only: %i[ show edit update destroy ]

  # GET /mktg_exports or /mktg_exports.json
  def index
    @mktg_exports = MktgExport.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MktgExport.delete_all
      redirect_to sequoia_customers_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @mktg_exports.to_csv, filename: "Mktg_Export-#{Date.today}.csv" }
    end

    if params['campaign'].present? && params['range_1_date_1'].present?
      MktgExport.delete_all
      dates


      if params['campaign'] == 'Return Customer' #CREATE the record just with UID
        SequoiaMemberExp.where(membership_exp: dates).where(membership: params['des']).all.each do |i|
          MktgExport.create(uid: i.uid, exp: i.membership_exp, campaign: 'Return Customer', des: params['des'])
        end
      elsif params['campaign'] == 'New Customer' && params['des'] == 'cpa'
        SequoiaMember.where(first_purchase: dates).where(cpa: true).where(cpa_memberships: 1).all.each do |i|
          MktgExport.create(uid: i.uid, exp: i.first_purchase, campaign: 'New Customer', des: params['des'])
        end
      elsif params['campaign'] == 'New Customer' && params['des'] == 'ea'
        SequoiaMember.where(first_purchase: dates).where(ea: true).where(ea_memberships: 1).all.each do |i|
          MktgExport.create(uid: i.uid, exp: i.first_purchase, campaign: 'New Customer', des: params['des'])
        end
      end


        MktgExport.all.each do |i| #Add the remaining customer infomation
          customer_data = SequoiaCustomer.find_by(uid: i.uid)
          MktgExport.where(uid: i.uid).update_all fname: customer_data.fname, lname: customer_data.lname, street_1: customer_data.street_1, street_2: customer_data.street_2, city: customer_data.city, state: customer_data.state, zip: customer_data.zip
        end

        #Add the Marketing TEXT (do with a table in the future?)
        if params['campaign'] == 'Return Customer' && params['des'] == 'cpa'
          MktgExport.update_all text_1: 'RC_CPA_Text_1',text_2: 'RC_CPA_Text_2',text_3: 'RC_CPA_Text_3'
        elsif params['campaign'] == 'Return Customer' && params['des'] == 'ea'
          MktgExport.update_all text_1: 'RC_EA_Text_1',text_2: 'RC_EA_Text_2',text_3: 'RC_EA_Text_3'
        elsif params['campaign'] == 'New Customer' && params['des'] == 'cpa'
          MktgExport.update_all text_1: 'NC_CPA_Text_1',text_2: 'NC_CPA_Text_2',text_3: 'NC_CPA_Text_3'
        elsif params['campaign'] == 'New Customer' && params['des'] == 'ea'
          MktgExport.update_all text_1: 'NC_EA_Text_1',text_2: 'NC_EA_Text_2',text_3: 'NC_EA_Text_3'
        end
    end
  end

  def print

  end

  def dates
    #FIND DATE RANGES FOR MktgExport
    dates = []
    if params['range_1_date_2'] == ''
      params['range_1_date_2'] = params['range_1_date_1']
    end
    if params['range_2_date_1'] == ''
      params['range_2_date_1'] = params['range_1_date_1']
      params['range_2_date_2'] = params['range_1_date_1']
    elsif params['range_2_date_2'] == ''
      params['range_2_date_2'] = params['range_2_date_1']
    end
    range_1 = params['range_1_date_1'].to_date..params['range_1_date_2'].to_date
    range_2 = params['range_2_date_1'].to_date..params['range_2_date_2'].to_date

    range_1.each do |i|
      dates.push(i)
    end
    range_2.each do |i|
      dates.push(i)
    end
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
      params.require(:mktg_export).permit(:uid, :campaign, :des, :exp, :fname, :lname, :street_1, :street_2, :city, :state, :zip, :text_1, :text_2, :text_3, :text_4, :text_5, :text_6, :text_7, :text_8, :text_9, :text_10)
    end
end
