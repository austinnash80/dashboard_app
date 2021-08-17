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
