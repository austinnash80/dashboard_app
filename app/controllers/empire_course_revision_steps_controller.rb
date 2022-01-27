class EmpireCourseRevisionStepsController < ApplicationController
  before_action :set_empire_course_revision_step, only: %i[ show edit update destroy ]

  # GET /empire_course_revision_steps or /empire_course_revision_steps.json
  def index
    @empire_course_revision_steps = EmpireCourseRevisionStep.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireCourseRevisionStep.delete_all
      redirect_to empire_course_revision_steps_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_course_revision_steps.to_csv, filename: "Empire-Course-Revision-Steps-#{Date.today}.csv" }
    end
  end

  # GET /empire_course_revision_steps/1 or /empire_course_revision_steps/1.json
  def show
  end

  # GET /empire_course_revision_steps/new
  def new
    @empire_course_revision_step = EmpireCourseRevisionStep.new
  end

  # GET /empire_course_revision_steps/1/edit
  def edit
  end

  # POST /empire_course_revision_steps or /empire_course_revision_steps.json
  def create
    @empire_course_revision_step = EmpireCourseRevisionStep.new(empire_course_revision_step_params)

    respond_to do |format|
      if @empire_course_revision_step.save
        format.html { redirect_to @empire_course_revision_step, notice: "Empire course revision step was successfully created." }
        format.json { render :show, status: :created, location: @empire_course_revision_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_course_revision_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_course_revision_steps/1 or /empire_course_revision_steps/1.json
  def update
    respond_to do |format|
      if @empire_course_revision_step.update(empire_course_revision_step_params)
        format.html { redirect_to @empire_course_revision_step, notice: "Empire course revision step was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_course_revision_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_course_revision_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_course_revision_steps/1 or /empire_course_revision_steps/1.json
  def destroy
    @empire_course_revision_step.destroy
    respond_to do |format|
      format.html { redirect_to empire_course_revision_steps_url, notice: "Empire course revision step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireCourseRevisionStep.my_import(params[:file])
    redirect_to empire_course_revision_steps_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_course_revision_step
      @empire_course_revision_step = EmpireCourseRevisionStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_course_revision_step_params
      params.require(:empire_course_revision_step).permit(:number, :phase, :step, :details, :assigned, :note, :due_date, :complete, :complete_date, :file, :empire_course_revision_id, :extra_s, :extra_i)
    end
end
