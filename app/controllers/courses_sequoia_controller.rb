class CoursesSequoiaController < ApplicationController
  before_action :set_courses_sequoium, only: %i[ show edit update destroy ]

  # GET /courses_sequoia or /courses_sequoia.json
  def index
    @courses_sequoia = CoursesSequoium.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      CoursesSequoium.delete_all
      redirect_to courses_sequoia_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @courses_sequoia.to_csv, filename: "courses_sequoia-#{Date.today}.csv" }
    end
  end

  def in_progress
    if params['update'] == 'text'
      CoursesSequoium.where(id: params['course_id']).update_all text: true
      redirect_to in_progress_courses_sequoia_path()
    elsif params['update'] == 'exam'
      CoursesSequoium.where(id: params['course_id']).update_all exam: true
      redirect_to in_progress_courses_sequoia_path()
    elsif params['update'] == 'active'
      CoursesSequoium.where(id: params['course_id']).update_all active: true
      redirect_to in_progress_courses_sequoia_path()
    elsif params['update'] == 'update_sheet'
      CoursesSequoium.where(id: params['course_id']).update_all update_sheet: false
      redirect_to in_progress_courses_sequoia_path()
    end
  end

  # GET /courses_sequoia/1 or /courses_sequoia/1.json
  def show
  end

  # GET /courses_sequoia/new
  def new
    @courses_sequoium = CoursesSequoium.new
  end

  # GET /courses_sequoia/1/edit
  def edit
  end

  # POST /courses_sequoia or /courses_sequoia.json
  def create
    @courses_sequoium = CoursesSequoium.new(courses_sequoium_params)

    respond_to do |format|
      if @courses_sequoium.save
        format.html { redirect_to @courses_sequoium, notice: "Courses sequoium was successfully created." }
        format.json { render :show, status: :created, location: @courses_sequoium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courses_sequoium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses_sequoia/1 or /courses_sequoia/1.json
  def update
    respond_to do |format|
      if @courses_sequoium.update(courses_sequoium_params)
        format.html { redirect_to courses_sequoia_path(), notice: "Courses sequoium was successfully updated." }
        format.json { render :show, status: :ok, location: @courses_sequoium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @courses_sequoium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses_sequoia/1 or /courses_sequoia/1.json
  def destroy
    @courses_sequoium.destroy
    respond_to do |format|
      format.html { redirect_to courses_sequoia_url, notice: "Courses sequoium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    CoursesSequoium.my_import(params[:file])
    redirect_to courses_sequoia_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courses_sequoium
      @courses_sequoium = CoursesSequoium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def courses_sequoium_params
      params.require(:courses_sequoium).permit(:number, :version, :title, :category, :sub_category, :hours, :pub_date, :pes_number, :pes_version, :text, :exam, :active, :update_sheet, :notes, :version_update, :new)
    end
end
