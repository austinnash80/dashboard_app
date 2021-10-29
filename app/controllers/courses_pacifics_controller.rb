class CoursesPacificsController < ApplicationController
  before_action :set_courses_pacific, only: %i[ show edit update destroy ]

  # GET /courses_pacifics or /courses_pacifics.json
  def index
    @courses_pacifics = CoursesPacific.all
    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      CoursesPacific.delete_all
      redirect_to courses_pacifics_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @courses_pacifics.to_csv, filename: "courses_pacifics-#{Date.today}.csv" }
    end

    if params['update'] == 'text'
      CoursesPacific.where(id: params['course_id']).update_all text: true
      redirect_to courses_pacifics_path(display: params['display'])
    elsif params['update'] == 'exam'
      CoursesPacific.where(id: params['course_id']).update_all exam: true
      redirect_to courses_pacifics_path(display: params['display'])
    elsif params['update'] == 'active'
      CoursesPacific.where(id: params['course_id']).update_all active: true
      course = CoursesPacific.find_by(id: params['course_id'].to_i)
      CoursesPacific.where(number: course.number).where.not(version: course.version).where(active: true).update_all active: false
      redirect_to courses_pacifics_path(display: params['display'])
    elsif params['update'] == 'update_sheet'
      CoursesPacific.where(id: params['course_id']).update_all update_sheet: false
      redirect_to courses_pacifics_path(display: params['display'])
    end

  end

  # GET /courses_pacifics/1 or /courses_pacifics/1.json
  def show
  end

  # GET /courses_pacifics/new
  def new
    @courses_pacific = CoursesPacific.new
  end

  # GET /courses_pacifics/1/edit
  def edit
  end

  # POST /courses_pacifics or /courses_pacifics.json
  def create
    @courses_pacific = CoursesPacific.new(courses_pacific_params)

    respond_to do |format|
      if @courses_pacific.save
        seq_courses = CoursesSequoium.pluck(:number)
        if seq_courses.exclude?(@courses_pacific.sequoia_number)
          redirect_to edit_courses_pacific_path(id: @courses_pacific.id), notice: 'Update Sequoia Course Number' and return
        end
        format.html { redirect_to @courses_pacific, notice: "Courses pacific was successfully created." }
        format.json { render :show, status: :created, location: @courses_pacific }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courses_pacific.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses_pacifics/1 or /courses_pacifics/1.json
  def update
    respond_to do |format|
      if @courses_pacific.update(courses_pacific_params)
        format.html { redirect_to @courses_pacific, notice: "Courses pacific was successfully updated." }
        format.json { render :show, status: :ok, location: @courses_pacific }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @courses_pacific.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses_pacifics/1 or /courses_pacifics/1.json
  def destroy
    @courses_pacific.destroy
    respond_to do |format|
      format.html { redirect_to courses_pacifics_url, notice: "Courses pacific was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    CoursesPacific.my_import(params[:file])
    redirect_to courses_pacifics_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courses_pacific
      @courses_pacific = CoursesPacific.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def courses_pacific_params
      params.require(:courses_pacific).permit(:number, :version, :title, :hours, :category, :sub_category, :pub_date, :sequoia_number, :sequoia_version, :text, :exam, :active, :new, :version_update, :update_sheet, :notes)
    end
end
