class SequoiaStatesController < ApplicationController
  before_action :set_sequoia_state, only: %i[ show edit update destroy ]

  # GET /sequoia_states or /sequoia_states.json
  def index
    @sequoia_states = SequoiaState.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      SequoiaState.delete_all
      redirect_to sequoia_states_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @sequoia_states.to_csv, filename: "Sequoia-States-#{Date.today}.csv" }
    end

    if params['list_quantity'] == 'run'
      SequoiaState.where.not(state: 'EA').all.each do |i| ##CPA
        list_quantity = MasterCpa.where(lic_st: i.st).count
        list = MasterCpa.where(lic_st: i.st).pluck(:list)[0]
        SequoiaState.where(id: i.id).update_all list: list, list_quantity: list_quantity
      end
      SequoiaState.where(state: 'EA').all.each do |i| ##EA
        list_quantity_ea = MasterEa.count
        list_ea = MasterEa.pluck(:list)[0]
        SequoiaState.where(id: i.id).update_all list: list_ea, list_quantity: list_quantity_ea
      end
      redirect_to sequoia_states_path()
    end
    if params['matched'] == 'run'
      matched_lid = MasterCpaMatch.pluck(:lid) ##CPA
      SequoiaState.where.not(state: 'EA').all.each do |i|
        matched = MasterCpa.where(lid: matched_lid).where(lic_st: i.st).count
        SequoiaState.where(id: i.id).update_all matched: matched
      end
      matched_lid_ea = MasterEaMatch.pluck(:lid) ##EA
      SequoiaState.where(state: 'EA').all.each do |i|
        matched_ea = MasterEa.where(lid: matched_lid_ea).count
        SequoiaState.where(id: i.id).update_all matched: matched_ea
      end
      SequoiaState.all.each do |i| ##Both
        ms = (i.matched.to_f / i.list_quantity.to_f).to_f * 100
        SequoiaState.where(id: i.id).update_all market_share: ms
      end
      redirect_to sequoia_states_path()
    end

  end

  # GET /sequoia_states/1 or /sequoia_states/1.json
  def show
  end

  # GET /sequoia_states/new
  def new
    @sequoia_state = SequoiaState.new
  end

  # GET /sequoia_states/1/edit
  def edit
  end

  # POST /sequoia_states or /sequoia_states.json
  def create
    @sequoia_state = SequoiaState.new(sequoia_state_params)

    respond_to do |format|
      if @sequoia_state.save
        format.html { redirect_to @sequoia_state, notice: "Sequoia state was successfully created." }
        format.json { render :show, status: :created, location: @sequoia_state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sequoia_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequoia_states/1 or /sequoia_states/1.json
  def update
    respond_to do |format|
      if @sequoia_state.update(sequoia_state_params)
        format.html { redirect_to sequoia_states_path(), notice: "Sequoia state was successfully updated." }
        format.json { render :show, status: :ok, location: @sequoia_state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sequoia_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequoia_states/1 or /sequoia_states/1.json
  def destroy
    @sequoia_state.destroy
    respond_to do |format|
      format.html { redirect_to sequoia_states_url, notice: "Sequoia state was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    SequoiaState.my_import(params[:file])
    redirect_to sequoia_states_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequoia_state
      @sequoia_state = SequoiaState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sequoia_state_params
      params.require(:sequoia_state).permit(:state, :st, :list, :list_quantity, :matched, :market_share, :ce_cycle, :hours_per_cycle, :ce_due, :exp_date, :exp_cycle, :self_study, :has_year_minimum, :year_minimum, :note)
    end
end
