class EmpireMasterCaMatchesController < ApplicationController
  before_action :set_empire_master_ca_match, only: %i[ show edit update destroy ]

  # GET /empire_master_ca_matches or /empire_master_ca_matches.json
  def index
    @empire_master_ca_matches = EmpireMasterCaMatch.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireMasterCaMatch.delete_all
      EmpireState.where(st: 'CA').update_all matched_customers: 0
      redirect_to empire_master_ca_matches_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_master_ca_matches.to_csv, filename: "Empire_Master_CA_Matches-#{Date.today}.csv" }
    end

    if params['run'] == 'yes'
      run
    end

    if params['dup'] == 'yes'
      member = EmpireMember.find_by(uid: params['uid'])
      master_match = EmpireMasterCaMatch.find_by(lid: params['lid'])
      # Switch the uid, add old (based n search data and last order) to uid2 and update member to 'dup'
      if member.last_purchase > master_match.search_date
        if master_match.uid2.present?
          EmpireMasterCaMatch.where(lid: master_match.lid).update_all uid: member.uid, uid3: master_match.uid, search_date: Time.now
        else
          EmpireMasterCaMatch.where(lid: master_match.lid).update_all uid: member.uid, uid2: master_match.uid, search_date: Time.now
        end
      else
        if master_match.uid2.present?
          EmpireMasterCaMatch.where(lid: master_match.lid).update_all uid3: member.uid
        else
          EmpireMasterCaMatch.where(lid: master_match.lid).update_all uid2: member.uid
        end
      end
      EmpireMember.where(uid: member.uid).update_all dup: true
      EmpireMember.where(uid: master_match.uid).update_all dup: true
      redirect_to empire_member_path(id: member.id)
    end

  end

  def run

    member = EmpireMember.where(state: "CA").pluck(:lic_num)
    master = EmpireMasterCaList.pluck(:lic)
    matched = EmpireMasterCaMatch.pluck(:lic)
    new = (master - matched) & member
    list = EmpireMasterCaList.first(1).pluck(:list)[0]

    if params['type'] == 'large'
      EmpireMasterCaList.select("id","lid","lic", "exp_date", "lname").where(lic: new).find_in_batches(batch_size: 500).each do |masters|
        masters.each do |master|
          uid = EmpireMember.find_by(lic_num: master.lic)
          EmpireMasterCaMatch.create(
            st: "CA",
            lid: master.lid,
            list: list,
            exp: master.exp_date,
            lic: master.lic,
            uid: uid.uid,
            lname: master.lname,
            search_date: Time.now,
          ).save
        end
      end
    elsif params['type'] == 'small'
      new.each do |i|
        EmpireMasterCaMatch.create(
          lic: i,
          st: 'CA',
          list: list,
          search_date: Time.now
        ).save
      end
      EmpireMasterCaMatch.where(uid: nil).each do |i|
        empire_member = EmpireMember.where(state: 'CA').find_by(lic_num: i.lic)
        master_list = EmpireMasterCaList.find_by(lic: i.lic)
        EmpireMasterCaMatch.where(id: i.id).update_all lid: master_list.lid, exp: master_list.exp_date, lname: master_list.lname, uid: empire_member.uid
      end
    end

    dup_primary = EmpireMasterCaMatch.where.not(uid2: nil).pluck(:uid)
    dup = EmpireMember.where(dup: true).where.not(uid: dup_primary).count
    expired = EmpireMember.where(state: 'CA').where(lic_expired: true).count
    other = EmpireMember.where(state: 'CA').where(lic_not_found: true).count + EmpireMember.where(state: 'CA').where(lic_not_in_master: true).count + dup
    total = EmpireMember.where(state: 'CA').count
    matched = EmpireMasterCaMatch.count
    EmpireState.where(st: 'CA').update_all customers: total, matched_customers: matched, lic_expired: expired, lic_other: other

    redirect_to list_data_hp_empire_states_path(), notice: "CA Update Done"
  end

  def lic_fix_member
    EmpireMember.where(state: 'CA').each do |i|
      unless i.lic_num.blank?
        unless i.lic_num.length == 8
          if i.lic_num.length == 1
            EmpireMember.where(id: i.id).update_all lic_num: '0000000' + i.lic_num
          elsif i.lic_num.length == 2
            EmpireMember.where(id: i.id).update_all lic_num: '000000' + i.lic_num
          elsif i.lic_num.length == 3
            EmpireMember.where(id: i.id).update_all lic_num: '00000' + i.lic_num
          elsif i.lic_num.length == 4
            EmpireMember.where(id: i.id).update_all lic_num: '0000' + i.lic_num
          elsif i.lic_num.length == 5
            EmpireMember.where(id: i.id).update_all lic_num: '000' + i.lic_num
          elsif i.lic_num.length == 6
            EmpireMember.where(id: i.id).update_all lic_num: '00' + i.lic_num
          elsif i.lic_num.length == 7
            EmpireMember.where(id: i.id).update_all lic_num: '0' + i.lic_num
          end
        end
      end
    end
  end

  def lic_fix_master
    EmpireMasterCaList.all.each do |i|
      unless i.lic.blank?
        unless i.lic.length == 8
          if i.lic.length == 1
            EmpireMasterCaList.where(id: i.id).update_all lic: '0000000' + i.lic
          elsif i.lic.length == 2
            EmpireMasterCaList.where(id: i.id).update_all lic:'000000' + i.lic
          elsif i.lic.length == 3
            EmpireMasterCaList.where(id: i.id).update_all lic:'00000' + i.lic
          elsif i.lic.length == 4
            EmpireMasterCaList.where(id: i.id).update_all lic:'0000' + i.lic
          elsif i.lic.length == 5
            EmpireMasterCaList.where(id: i.id).update_all lic:'000' + i.lic
          elsif i.lic.length == 6
            EmpireMasterCaList.where(id: i.id).update_all lic:'00' + i.lic
          elsif i.lic.length == 7
            EmpireMasterCaList.where(id: i.id).update_all lic:'0' + i.lic
          end
        end
      end
    end
  end


  # GET /empire_master_ca_matches/1 or /empire_master_ca_matches/1.json
  def show
  end

  # GET /empire_master_ca_matches/new
  def new
    @empire_master_ca_match = EmpireMasterCaMatch.new
  end

  # GET /empire_master_ca_matches/1/edit
  def edit
  end

  # POST /empire_master_ca_matches or /empire_master_ca_matches.json
  def create
    @empire_master_ca_match = EmpireMasterCaMatch.new(empire_master_ca_match_params)

    respond_to do |format|
      if @empire_master_ca_match.save
        format.html { redirect_to @empire_master_ca_match, notice: "Empire master ca match was successfully created." }
        format.json { render :show, status: :created, location: @empire_master_ca_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_master_ca_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_master_ca_matches/1 or /empire_master_ca_matches/1.json
  def update
    respond_to do |format|
      if @empire_master_ca_match.update(empire_master_ca_match_params)
        format.html { redirect_to @empire_master_ca_match, notice: "Empire master ca match was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_master_ca_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_master_ca_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_master_ca_matches/1 or /empire_master_ca_matches/1.json
  def destroy
    @empire_master_ca_match.destroy
    respond_to do |format|
      format.html { redirect_to empire_master_ca_matches_url, notice: "Empire master ca match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireMasterCaMatch.my_import(params[:file])
    redirect_to empire_master_ca_matches_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_master_ca_match
      @empire_master_ca_match = EmpireMasterCaMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_master_ca_match_params
      params.require(:empire_master_ca_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date, :uid2, :uid3, :notes)
    end
end
