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

  end

  def run
      ## MATCH BY LNAME AND LIC
      # already_matched_uid = EmpireMasterCaMatch.pluck(:uid)
      # lic = EmpireMember.where(state: 'CA').where.not(uid: already_matched_uid).pluck(:lic_num)
      # master = EmpireMasterCaList.pluck(:lic, :lname)
      # customer = EmpireMember.where.not(uid: already_matched_uid).where(state: 'CA').pluck(:lic_num, :lname)
      # match = (customer & master)
      # lic = [].uniq
      #
      # match.each do |a,b|
      #   lic.push(a)
      # end
      ## END DOUBLE MATCH

      # if params['empire_member_id'].present?
      #   empire_member_id_max = empire_member_id.max
      # else
      #   empire_member_id_max = 0
      # end


    # empire_member_id = []
    already_matched_uid = EmpireMasterCaMatch.pluck(:uid)
      EmpireMember.order(id: :asc).where("id > ?", empire_member_id_max).where(state: 'CA').where.not(uid: already_matched_uid).each do |i|
        master = EmpireMasterCaList.find_by(lic: i.lic_num)
        if master.present?
          EmpireMasterCaMatch.create(
            st: "CA",
            lid: master.lid,
            list: master.list,
            exp: master.exp_date,
            lic: master.lic,
            uid: i.uid,
            lname: master.lname,
            search_date: Time.now,
          ).save
        end
        # empire_member_id.push(i.id)
        # if empire_member_id.length > 200
        #   redirect_to empire_master_ca_matches_path(run: 'yes', route: 'hp', empire_member_id_max: empire_member_id.max), notice: "CA Update Done" and return
        # end
      end

    total = EmpireMember.where(state: 'CA').count
    matched = EmpireMasterCaMatch.count
    EmpireState.where(st: 'CA').update_all customers: total, matched_customers: matched

    redirect_to list_data_hp_empire_states_path(), notice: "CA Update Done"
    # redirect_to empire_master_ca_matches_path(), notice: "Update Done"
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
      params.require(:empire_master_ca_match).permit(:st, :lid, :list, :exp, :lic, :uid, :lname, :search_date)
    end
end
