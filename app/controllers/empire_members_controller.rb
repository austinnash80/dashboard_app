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
        EmpireMember.create(uid: i.uid, lname: i.lname, first_purchase: i.purchase, last_purchase: i.purchase, purchases: 0).save
      end
      redirect_to empire_members_path(), notice: 'New Member Update Complete'
  end

  def run_update_2 #Purchases
    @e_id = (IdNumberStorage.pluck(:empire_member_e_id))[0]
      EmpireCustomer.where('e_id > ?', @e_id).order(id: :asc).each do |i|
        member = EmpireMember.find_by(uid: i.uid)
        EmpireMember.where(uid: i.uid).update_all state: i.lic_state, last_purchase: i.purchase, purchases: (member.purchases + 1)
        IdNumberStorage.update_all empire_member_e_id: i.e_id
      end
      redirect_to empire_members_path(), notice: 'Purchase Update Complete'
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
      params.require(:empire_member).permit(:uid, :lname, :first_purchase, :last_purchase, :state, :purchases, :email_unsubscribe)
    end
end
