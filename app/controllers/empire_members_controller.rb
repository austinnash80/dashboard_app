class EmpireMembersController < ApplicationController
  before_action :set_empire_member, only: %i[ show edit update destroy ]

  # GET /empire_members or /empire_members.json
  def index
    @empire_members = EmpireMember.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMember.delete_all
      redirect_to empire_members_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_members.to_csv, filename: "Empire_Members-#{Date.today}.csv" }
    end

  end

  def run_update #Adding new Members
    @e_id = (IdNumberStorage.pluck(:empire_member_e_id))[0]
    uid = EmpireMember.pluck(:uid) #So no duplicates created (alredy in the table)

      EmpireCustomer.where('e_id > ?', @e_id).where.not(uid: uid).order(id: :ASC).all.each do |i|
        EmpireMember.create(uid: i.uid, fname: i.fname,lname: i.lname, first_purchase: i.purchase, last_purchase: i.purchase, purchases: 0, lic_expired: false, lic_edit: false, lic_not_found: false, lic_not_in_master: false).save
      end
      redirect_to empire_members_path(), notice: 'New Member Update Complete'
  end
  def run_update_2 #Purchases
    @e_id = (IdNumberStorage.pluck(:empire_member_e_id))[0]
      EmpireCustomer.where('e_id > ?', @e_id).order(id: :asc).each do |i|
        member = EmpireMember.find_by(uid: i.uid)
        EmpireMember.where(uid: i.uid).update_all state: i.lic_state, last_purchase: i.purchase, lic_num: i.lic_num, email: i.email, purchases: (member.purchases + 1)
          # LIC LEADDING ZERO FIX
          if member.state == 'CA' || member.state == 'NJ'
            unless member.lic_num.blank?
              member_lic = EmpireMember.find_by(uid: i.uid)
              if member_lic.state == 'CA' && member_lic.lic_num.length != 8
                if member_lic.lic_num.length == 4
                  EmpireMember.where(id: member_lic.id).update_all lic_num: '0000' + member_lic.lic_num
                elsif member_lic.lic_num.length == 5
                  EmpireMember.where(id: member_lic.id).update_all lic_num: '000' + member_lic.lic_num
                elsif member_lic.lic_num.length == 6
                  EmpireMember.where(id: member_lic.id).update_all lic_num: '00' + member_lic.lic_num
                elsif member_lic.lic_num.length == 7
                  EmpireMember.where(id: member_lic.id).update_all lic_num: '0' + member_lic.lic_num
                end
              elsif member_lic.state == 'NJ' && member_lic.lic_num.length != 7
                if member_lic.lic_num.length == 3
                  EmpireMember.where(id: member_lic.id).update_all lic_num: '0000' + member_lic.lic_num
                elsif member_lic.lic_num.length == 4
                  EmpireMember.where(id: member_lic.id).update_all lic_num: '000' + member_lic.lic_num
                elsif member_lic.lic_num.length == 5
                  EmpireMember.where(id: member_lic.id).update_all lic_num: '00' + member_lic.lic_num
                elsif member_lic.lic_num.length == 6
                  EmpireMember.where(id: member_lic.id).update_all lic_num: '0' + member_lic.lic_num
                end
              end
            end
          end

        if member.lname.present? ## LAST NAME UPCASE
          EmpireMember.where(id: member.id).update_all lname: member.lname.upcase
        end ## END LAST NAME FIX
        if member.lic_num.present? ## LIC UPCASE
          EmpireMember.where(id: member.id).update_all lic_num: member.lic_num.upcase
        end ## END LAST NAME FIX
        IdNumberStorage.update_all empire_member_e_id: i.e_id
      end
      redirect_to empire_members_path(), notice: 'Purchase Update Complete'
  end

  def ca_lic_fix # 8 DIGITS FORMAT

  end
  def nj_lic_fix

  end

  # GET /empire_members/1 or /empire_members/1.json
  def show
  end

  # GET /empire_members/new
  def new
    @empire_member = EmpireMember.new
  end

  # GET /empire_members/1/edit
  def edit
  end

  # POST /empire_members or /empire_members.json
  def create
    @empire_member = EmpireMember.new(empire_member_params)

    respond_to do |format|
      if @empire_member.save
        format.html { redirect_to @empire_member, notice: "Empire member was successfully created." }
        format.json { render :show, status: :created, location: @empire_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_members/1 or /empire_members/1.json
  def update
    respond_to do |format|
      if @empire_member.update(empire_member_params)
        format.html { redirect_to @empire_member, notice: "Empire member was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_members/1 or /empire_members/1.json
  def destroy
    @empire_member.destroy
    respond_to do |format|
      format.html { redirect_to empire_members_url, notice: "Empire member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMember.my_import(params[:file])
    redirect_to empire_members_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_member
      @empire_member = EmpireMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_member_params
      params.require(:empire_member).permit(:uid, :lname, :first_purchase, :last_purchase, :state, :purchases, :email_unsubscribe, :email, :lic_num, :fname, :lic_expired, :lic_not_found, :lic_edit, :lic_notes, :lic_not_in_master)
    end
end
