class EmpireStateTasksSupplimentsController < ApplicationController
  before_action :set_empire_state_tasks_suppliment, only: %i[ show edit update destroy ]

  # GET /empire_state_tasks_suppliments or /empire_state_tasks_suppliments.json
  def index
    @empire_state_tasks_suppliments = EmpireStateTasksSuppliment.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireStateTasksSuppliment.delete_all
      redirect_to empire_state_tasks_suppliments_path(), notice: 'Records Deleted'
    end
    
    respond_to do |format|
      format.html
      format.csv { send_data @empire_state_tasks_suppliments.to_csv, filename: "Empire-State-Task-Suppliment-#{Date.today}.csv" }
    end

  end

  # GET /empire_state_tasks_suppliments/1 or /empire_state_tasks_suppliments/1.json
  def show
  end

  # GET /empire_state_tasks_suppliments/new
  def new
    @empire_state_tasks_suppliment = EmpireStateTasksSuppliment.new
  end

  # GET /empire_state_tasks_suppliments/1/edit
  def edit
  end

  # POST /empire_state_tasks_suppliments or /empire_state_tasks_suppliments.json
  def create
    @empire_state_tasks_suppliment = EmpireStateTasksSuppliment.new(empire_state_tasks_suppliment_params)

    respond_to do |format|
      if @empire_state_tasks_suppliment.save
        format.html { redirect_to @empire_state_tasks_suppliment, notice: "Empire state tasks suppliment was successfully created." }
        format.json { render :show, status: :created, location: @empire_state_tasks_suppliment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_state_tasks_suppliment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_state_tasks_suppliments/1 or /empire_state_tasks_suppliments/1.json
  def update
    respond_to do |format|
      if @empire_state_tasks_suppliment.update(empire_state_tasks_suppliment_params)
        format.html { redirect_to @empire_state_tasks_suppliment, notice: "Empire state tasks suppliment was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_state_tasks_suppliment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_state_tasks_suppliment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_state_tasks_suppliments/1 or /empire_state_tasks_suppliments/1.json
  def destroy
    @empire_state_tasks_suppliment.destroy
    respond_to do |format|
      format.html { redirect_to empire_state_tasks_suppliments_url, notice: "Empire state tasks suppliment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireStateTasksSuppliment.my_import(params[:file])
    redirect_to empire_state_tasks_suppliments_path(), notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_state_tasks_suppliment
      @empire_state_tasks_suppliment = EmpireStateTasksSuppliment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_state_tasks_suppliment_params
      params.require(:empire_state_tasks_suppliment).permit(:step_number, :step_name)
    end
end
