class EmpireStatesController < ApplicationController
  before_action :set_empire_state, only: %i[ show edit update destroy ]

  # GET /empire_states or /empire_states.json
  def index
    @empire_states = EmpireState.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireState.delete_all
      redirect_to empire_states_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_states.to_csv, filename: "Empire-States-#{Date.today}.csv" }
    end

    # RUN CUSTOMER UPDATE
    if params['run'].present? && params['run'] == 'NY'
      ny_total = EmpireMember.where(state: 'NY').count
      ny_already_matched_uid = EmpireMasterMatch.where(lic_st: 'NY').pluck(:uid)
      ny_master = EmpireMasterNyList.pluck(:lic, :lname)
      ny_customer = EmpireMember.where.not(uid: ny_already_matched_uid).where(state: 'NY').pluck(:lic_num, :lname)
      ny_match = (ny_customer & ny_master)
      ny_lic = [].uniq

      ny_match.each do |a,b|
        ny_lic.push(a)
      end

      EmpireMember.where(state: 'NY').where(lic_num: ny_lic).each do |i|
        master = EmpireMasterNyList.find_by(lic: i.lic_num)
        EmpireMasterMatch.create(
          lid: master.lid,
          list: master.list,
          exp: master.exp_date,
          lic_st: master.lic_state,
          lic: master.lic,
          uid: i.uid,
          lname: master.lname,
          search_date: Time.now,
        ).save
      end

      ny_matched = EmpireMasterMatch.where(lic_st: 'NY').count
      EmpireState.where(st: 'NY').update_all customers: ny_total, matched_customers: ny_matched

      redirect_to empire_states_path(), notice: "NY Update Done"

    elsif params['run'].present? && params['run'] == 'CA'
      ca_total = EmpireMember.where(state: 'CA').count
      ca_already_matched_uid = EmpireMasterMatch.where(lic_st: 'CA').pluck(:uid)
      ca_master = EmpireMasterCaList.pluck(:lic, :lname)
      ca_customer = EmpireMember.where.not(uid: ca_already_matched_uid).where(state: 'CA').pluck(:lic_num, :lname)
      ca_match = (ca_customer & ca_master)
      ca_lic = [].uniq

      ca_match.each do |a,b|
        ca_lic.push(a)
      end

      EmpireMember.where(state: 'CA').where(lic_num: ca_lic).each do |i|
        master = EmpireMasterCaList.find_by(lic: i.lic_num)
        EmpireMasterMatch.create(
          lid: master.lid,
          list: master.list,
          exp: master.exp_date,
          lic_st: master.lic_state,
          lic: master.lic,
          uid: i.uid,
          lname: master.lname,
          search_date: Time.now,
        ).save
      end

      ca_matched = EmpireMasterMatch.where(lic_st: 'CA').count
      EmpireState.where(st: 'CA').update_all customers: ca_total, matched_customers: ca_matched

      redirect_to empire_states_path(), notice: "CA Update Done"
  elsif params['run'].present? && params['run'] == 'NC'
      nc_total = EmpireMember.where(state: 'NC').count
      nc_list = EmpireMasterNcList.count
      nc_already_matched_uid = EmpireMasterMatch.where(lic_st: 'NC').pluck(:uid)
      nc_master = EmpireMasterNcList.pluck(:lic, :lname)
      nc_customer = EmpireMember.where.not(uid: nc_already_matched_uid).where(state: 'NC').pluck(:lic_num, :lname)
      nc_match = (nc_customer & nc_master)
      nc_lic = [].uniq

      nc_match.each do |a,b|
        nc_lic.push(a)
      end

      EmpireMember.where(state: 'NC').where(lic_num: nc_lic).each do |i|
        master = EmpireMasterNcList.find_by(lic: i.lic_num)
        EmpireMasterMatch.create(
          lid: master.lid,
          list: master.list,
          exp: master.exp_date,
          lic_st: master.lic_state,
          lic: master.lic,
          uid: i.uid,
          lname: master.lname,
          search_date: Time.now,
        ).save
      end

      nc_matched = EmpireMasterMatch.where(lic_st: 'NC').count
      EmpireState.where(st: 'NC').update_all customers: nc_total, matched_customers: nc_matched, list_size: nc_list

      redirect_to empire_states_path(), notice: "NC Update Done"
    elsif params['run'].present? && params['run'] == 'NJ'
      nj_total = EmpireMember.where(state: 'NJ').count
      nj_list = EmpireMasterNjList.count
      nj_already_matched_uid = EmpireMasterMatch.where(lic_st: 'NJ').pluck(:uid)
      nj_master = EmpireMasterNjList.pluck(:lic, :lname)
      nj_customer = EmpireMember.where.not(uid: nj_already_matched_uid).where(state: 'NJ').pluck(:lic_num, :lname)
      nj_match = (nj_customer & nj_master)
      nj_lic = [].uniq

      nj_match.each do |a,b|
        nj_lic.push(a)
      end

      EmpireMember.where(state: 'NJ').where(lic_num: nj_lic).each do |i|
        master = EmpireMasterNjList.find_by(lic: i.lic_num)
        EmpireMasterMatch.create(
          lid: master.lid,
          list: master.list,
          exp: master.exp_date,
          lic_st: master.lic_state,
          lic: master.lic,
          uid: i.uid,
          lname: master.lname,
          search_date: Time.now,
        ).save
      end

      nj_matched = EmpireMasterMatch.where(lic_st: 'NJ').count
      EmpireState.where(st: 'NJ').update_all customers: nj_total, matched_customers: nj_matched, list_size: nj_list

      redirect_to empire_states_path(), notice: "NJ Update Done"
    end

  end

  # GET /empire_states/1 or /empire_states/1.json
  def show
  end

  # GET /empire_states/new
  def new
    @empire_state = EmpireState.new
  end

  # GET /empire_states/1/edit
  def edit
  end

  # POST /empire_states or /empire_states.json
  def create
    @empire_state = EmpireState.new(empire_state_params)

    respond_to do |format|
      if @empire_state.save
        format.html { redirect_to empire_states_path(), notice: "Empire state was successfully created." }
        format.json { render :show, status: :created, location: @empire_state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_states/1 or /empire_states/1.json
  def update
    respond_to do |format|
      if @empire_state.update(empire_state_params)
        format.html { redirect_to empire_states_path(), notice: "Empire state was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_state.errors, status: :unprocessable_entity }
      end
    end
  end

  def import #Uploading CSV function
    EmpireState.my_import(params[:file])
    redirect_to empire_states_path(), notice: "Upload Complete"
  end

  # DELETE /empire_states/1 or /empire_states/1.json
  def destroy
    @empire_state.destroy
    respond_to do |format|
      format.html { redirect_to empire_states_url, notice: "Empire state was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_state
      @empire_state = EmpireState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_state_params
      params.require(:empire_state).permit(:state, :st, :customers, :matched_customers, :list_size, :list_date, :list_cost, :list_notes, :exp_type, :renewal_cycle, :next_exp, :exp_notes, :link)
    end
end
