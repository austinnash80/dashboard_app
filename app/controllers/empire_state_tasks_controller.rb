class EmpireStateTasksController < ApplicationController
  before_action :set_empire_state_task, only: %i[ show edit update destroy ]

  # GET /empire_state_tasks or /empire_state_tasks.json
  def index
    @empire_state_tasks = EmpireStateTask.all
    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireStateTask.delete_all
      redirect_to empire_state_tasks_path(), notice: 'Records Deleted'
    end

    respond_to do |format|
      format.html
      format.csv { send_data @empire_state_tasks.to_csv, filename: "Empire-State-Tasks-#{Date.today}.csv" }
    end
  end

  # GET /empire_state_tasks/1 or /empire_state_tasks/1.json
  def show
  end

  # GET /empire_state_tasks/new
  def new
    @empire_state_task = EmpireStateTask.new
  end

  # GET /empire_state_tasks/1/edit
  def edit
  end

  # POST /empire_state_tasks or /empire_state_tasks.json
  def create
    @empire_state_task = EmpireStateTask.new(empire_state_task_params)

    respond_to do |format|
      if @empire_state_task.save
        format.html { redirect_to empire_state_path(id: @empire_state_task.empire_state_id), notice: "Empire state task was successfully created." }
        format.json { render :show, status: :created, location: @empire_state_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_state_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_state_tasks/1 or /empire_state_tasks/1.json
  def update
    respond_to do |format|
      if @empire_state_task.update(empire_state_task_params)
        format.html { redirect_to empire_state_path(id: @empire_state_task.empire_state_id), notice: "Empire state task was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_state_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_state_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_state_tasks/1 or /empire_state_tasks/1.json
  def destroy
    @empire_state_task.destroy
    respond_to do |format|
      format.html { redirect_to empire_state_path(id: @empire_state_task.empire_state_id), notice: "Empire state task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireStateTask.my_import(params[:file])
    redirect_to empire_state_tasks_path(), notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_state_task
      @empire_state_task = EmpireStateTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_state_task_params
      params.require(:empire_state_task).permit(:empire_state_id, :step_number, :step_name, :details, :assigned, :due_date, :completed, :completed_date, :task_notes)
    end
end
