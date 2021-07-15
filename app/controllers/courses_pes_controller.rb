class CoursesPesController < ApplicationController
  before_action :set_courses_pe, only: %i[ show edit update destroy ]

  # GET /courses_pes or /courses_pes.json
  def index
    @courses_pes = CoursesPe.all
    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      CoursesPe.delete_all
      redirect_to courses_pes_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @courses_pes.to_csv, filename: "courses_pes-#{Date.today}.csv" }
    end
  end

  # GET /courses_pes/1 or /courses_pes/1.json
  def show
  end

  # GET /courses_pes/new
  def new
    @courses_pe = CoursesPe.new
  end

  # GET /courses_pes/1/edit
  def edit
  end

  # POST /courses_pes or /courses_pes.json
  def create
    @courses_pe = CoursesPe.new(courses_pe_params)

    respond_to do |format|
      if @courses_pe.save
        # Create new entry in 'CoursesSequoia' -> ready for new update to be completed
        sequoia_course = CoursesSequoium.find_by(pes_number: @courses_pe.number)
        sequoia_course_version = CoursesSequoium.where(pes_number: @courses_pe.number).pluck(:version).sort

        if @courses_pe.pes_number_change.present? #IF PES CHANGED THEIR COURSE NUMBER AND SEQUOIA DID NOT - USE 'PES_NUMBER_CHANGE' FOR THIS PART
          sequoia_course = CoursesSequoium.find_by(pes_number: @courses_pe.pes_number_change)
          sequoia_course_version = CoursesSequoium.where(pes_number: @courses_pe.pes_number_change).pluck(:version).sort
        end

        if sequoia_course.present? && @courses_pe.version_update? == true
          CoursesSequoium.create(
            version_update: true,
            number: sequoia_course.number,
            version: sequoia_course_version.last.next,
            hours: @courses_pe.hours,
            pes_number: @courses_pe.number,
            pes_version: @courses_pe.version,
            pub_date: @courses_pe.pub_date,
            title: sequoia_course.title,
            category: sequoia_course.category,
            sub_category: sequoia_course.sub_category,
            text: false,
            exam: false,
            active: false,
            update_sheet: true
          ).save
        elsif @courses_pe.new? == true
          CoursesSequoium.create(
            new: true,
            number: 0,
            # version: sequoia_course_version.last.next,
            hours: @courses_pe.hours,
            pes_number: @courses_pe.number,
            pes_version: @courses_pe.version,
            pub_date: @courses_pe.pub_date,
            # title: sequoia_course.title,
            category: @courses_pe.category,
            sub_category: @courses_pe.sub_category,
            text: false,
            exam: false,
            active: false,
            update_sheet: true
          ).save
        end


        format.html { redirect_to courses_pes_path(), notice: "Courses pe was successfully created." }
        format.json { render :show, status: :created, location: @courses_pe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courses_pe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses_pes/1 or /courses_pes/1.json
  def update
    respond_to do |format|
      if @courses_pe.update(courses_pe_params)
        format.html { redirect_to @courses_pe, notice: "Courses pe was successfully updated." }
        format.json { render :show, status: :ok, location: @courses_pe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @courses_pe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses_pes/1 or /courses_pes/1.json
  def destroy
    @courses_pe.destroy
    respond_to do |format|
      format.html { redirect_to courses_pes_url, notice: "Courses pe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    CoursesPe.my_import(params[:file])
    redirect_to courses_pes_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courses_pe
      @courses_pe = CoursesPe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def courses_pe_params
      params.require(:courses_pe).permit(:number, :version, :title, :category, :sub_category, :hours, :pub_date, :version_update, :new, :pes_number_change, :notes)
    end
end
