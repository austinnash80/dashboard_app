class EmpireCourseRevisionsController < ApplicationController
  before_action :set_empire_course_revision, only: %i[ show edit update destroy ]

  # GET /empire_course_revisions or /empire_course_revisions.json
  def index
    @empire_course_revisions = EmpireCourseRevision.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      EmpireCourseRevision.delete_all
      redirect_to empire_course_revisions_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @empire_course_revisions.to_csv, filename: "Empire-Course-Revision-#{Date.today}.csv" }
    end

  end

  # GET /empire_course_revisions/1 or /empire_course_revisions/1.json
  def show
  end

  # GET /empire_course_revisions/new
  def new
    @empire_course_revision = EmpireCourseRevision.new
  end

  # GET /empire_course_revisions/1/edit
  def edit
  end

  # POST /empire_course_revisions or /empire_course_revisions.json
  def create
    @empire_course_revision = EmpireCourseRevision.new(empire_course_revision_params)

    respond_to do |format|
      if @empire_course_revision.save
        format.html { redirect_to @empire_course_revision, notice: "Empire course revision was successfully created." }
        format.json { render :show, status: :created, location: @empire_course_revision }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empire_course_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empire_course_revisions/1 or /empire_course_revisions/1.json
  def update
    respond_to do |format|
      if @empire_course_revision.update(empire_course_revision_params)
        format.html { redirect_to @empire_course_revision, notice: "Empire course revision was successfully updated." }
        format.json { render :show, status: :ok, location: @empire_course_revision }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empire_course_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empire_course_revisions/1 or /empire_course_revisions/1.json
  def destroy
    @empire_course_revision.destroy
    respond_to do |format|
      format.html { redirect_to empire_course_revisions_url, notice: "Empire course revision was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    EmpireCourseRevision.my_import(params[:file])
    redirect_to empire_course_revisions_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empire_course_revision
      @empire_course_revision = EmpireCourseRevision.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empire_course_revision_params
      params.require(:empire_course_revision).permit(:priority, :course_number, :course, :course_type, :state, :status, :hour, :revision, :note, :upgrades)
    end
end
