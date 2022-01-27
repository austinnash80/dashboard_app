require "test_helper"

class EmpireCourseRevisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_course_revision = empire_course_revisions(:one)
  end

  test "should get index" do
    get empire_course_revisions_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_course_revision_url
    assert_response :success
  end

  test "should create empire_course_revision" do
    assert_difference('EmpireCourseRevision.count') do
      post empire_course_revisions_url, params: { empire_course_revision: { course: @empire_course_revision.course, course_number: @empire_course_revision.course_number, course_type: @empire_course_revision.course_type, hour: @empire_course_revision.hour, note: @empire_course_revision.note, priority: @empire_course_revision.priority, revision: @empire_course_revision.revision, state: @empire_course_revision.state, status: @empire_course_revision.status, upgrades: @empire_course_revision.upgrades } }
    end

    assert_redirected_to empire_course_revision_url(EmpireCourseRevision.last)
  end

  test "should show empire_course_revision" do
    get empire_course_revision_url(@empire_course_revision)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_course_revision_url(@empire_course_revision)
    assert_response :success
  end

  test "should update empire_course_revision" do
    patch empire_course_revision_url(@empire_course_revision), params: { empire_course_revision: { course: @empire_course_revision.course, course_number: @empire_course_revision.course_number, course_type: @empire_course_revision.course_type, hour: @empire_course_revision.hour, note: @empire_course_revision.note, priority: @empire_course_revision.priority, revision: @empire_course_revision.revision, state: @empire_course_revision.state, status: @empire_course_revision.status, upgrades: @empire_course_revision.upgrades } }
    assert_redirected_to empire_course_revision_url(@empire_course_revision)
  end

  test "should destroy empire_course_revision" do
    assert_difference('EmpireCourseRevision.count', -1) do
      delete empire_course_revision_url(@empire_course_revision)
    end

    assert_redirected_to empire_course_revisions_url
  end
end
