require "test_helper"

class EmpireCourseRevisionStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_course_revision_step = empire_course_revision_steps(:one)
  end

  test "should get index" do
    get empire_course_revision_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_course_revision_step_url
    assert_response :success
  end

  test "should create empire_course_revision_step" do
    assert_difference('EmpireCourseRevisionStep.count') do
      post empire_course_revision_steps_url, params: { empire_course_revision_step: { assigned: @empire_course_revision_step.assigned, complete: @empire_course_revision_step.complete, complete_date: @empire_course_revision_step.complete_date, details: @empire_course_revision_step.details, due_date: @empire_course_revision_step.due_date, empire_course_revision_id: @empire_course_revision_step.empire_course_revision_id, extra_i: @empire_course_revision_step.extra_i, extra_s: @empire_course_revision_step.extra_s, file: @empire_course_revision_step.file, note: @empire_course_revision_step.note, number: @empire_course_revision_step.number, phase: @empire_course_revision_step.phase, step: @empire_course_revision_step.step } }
    end

    assert_redirected_to empire_course_revision_step_url(EmpireCourseRevisionStep.last)
  end

  test "should show empire_course_revision_step" do
    get empire_course_revision_step_url(@empire_course_revision_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_course_revision_step_url(@empire_course_revision_step)
    assert_response :success
  end

  test "should update empire_course_revision_step" do
    patch empire_course_revision_step_url(@empire_course_revision_step), params: { empire_course_revision_step: { assigned: @empire_course_revision_step.assigned, complete: @empire_course_revision_step.complete, complete_date: @empire_course_revision_step.complete_date, details: @empire_course_revision_step.details, due_date: @empire_course_revision_step.due_date, empire_course_revision_id: @empire_course_revision_step.empire_course_revision_id, extra_i: @empire_course_revision_step.extra_i, extra_s: @empire_course_revision_step.extra_s, file: @empire_course_revision_step.file, note: @empire_course_revision_step.note, number: @empire_course_revision_step.number, phase: @empire_course_revision_step.phase, step: @empire_course_revision_step.step } }
    assert_redirected_to empire_course_revision_step_url(@empire_course_revision_step)
  end

  test "should destroy empire_course_revision_step" do
    assert_difference('EmpireCourseRevisionStep.count', -1) do
      delete empire_course_revision_step_url(@empire_course_revision_step)
    end

    assert_redirected_to empire_course_revision_steps_url
  end
end
