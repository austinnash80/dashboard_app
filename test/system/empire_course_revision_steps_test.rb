require "application_system_test_case"

class EmpireCourseRevisionStepsTest < ApplicationSystemTestCase
  setup do
    @empire_course_revision_step = empire_course_revision_steps(:one)
  end

  test "visiting the index" do
    visit empire_course_revision_steps_url
    assert_selector "h1", text: "Empire Course Revision Steps"
  end

  test "creating a Empire course revision step" do
    visit empire_course_revision_steps_url
    click_on "New Empire Course Revision Step"

    fill_in "Assigned", with: @empire_course_revision_step.assigned
    check "Complete" if @empire_course_revision_step.complete
    fill_in "Complete date", with: @empire_course_revision_step.complete_date
    fill_in "Details", with: @empire_course_revision_step.details
    fill_in "Due date", with: @empire_course_revision_step.due_date
    fill_in "Empire course revision", with: @empire_course_revision_step.empire_course_revision_id
    fill_in "Extra i", with: @empire_course_revision_step.extra_i
    fill_in "Extra s", with: @empire_course_revision_step.extra_s
    fill_in "File", with: @empire_course_revision_step.file
    fill_in "Note", with: @empire_course_revision_step.note
    fill_in "Number", with: @empire_course_revision_step.number
    fill_in "Phase", with: @empire_course_revision_step.phase
    fill_in "Step", with: @empire_course_revision_step.step
    click_on "Create Empire course revision step"

    assert_text "Empire course revision step was successfully created"
    click_on "Back"
  end

  test "updating a Empire course revision step" do
    visit empire_course_revision_steps_url
    click_on "Edit", match: :first

    fill_in "Assigned", with: @empire_course_revision_step.assigned
    check "Complete" if @empire_course_revision_step.complete
    fill_in "Complete date", with: @empire_course_revision_step.complete_date
    fill_in "Details", with: @empire_course_revision_step.details
    fill_in "Due date", with: @empire_course_revision_step.due_date
    fill_in "Empire course revision", with: @empire_course_revision_step.empire_course_revision_id
    fill_in "Extra i", with: @empire_course_revision_step.extra_i
    fill_in "Extra s", with: @empire_course_revision_step.extra_s
    fill_in "File", with: @empire_course_revision_step.file
    fill_in "Note", with: @empire_course_revision_step.note
    fill_in "Number", with: @empire_course_revision_step.number
    fill_in "Phase", with: @empire_course_revision_step.phase
    fill_in "Step", with: @empire_course_revision_step.step
    click_on "Update Empire course revision step"

    assert_text "Empire course revision step was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire course revision step" do
    visit empire_course_revision_steps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire course revision step was successfully destroyed"
  end
end
