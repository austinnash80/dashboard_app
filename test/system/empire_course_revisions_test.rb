require "application_system_test_case"

class EmpireCourseRevisionsTest < ApplicationSystemTestCase
  setup do
    @empire_course_revision = empire_course_revisions(:one)
  end

  test "visiting the index" do
    visit empire_course_revisions_url
    assert_selector "h1", text: "Empire Course Revisions"
  end

  test "creating a Empire course revision" do
    visit empire_course_revisions_url
    click_on "New Empire Course Revision"

    fill_in "Course", with: @empire_course_revision.course
    fill_in "Course number", with: @empire_course_revision.course_number
    fill_in "Course type", with: @empire_course_revision.course_type
    fill_in "Hour", with: @empire_course_revision.hour
    fill_in "Note", with: @empire_course_revision.note
    fill_in "Priority", with: @empire_course_revision.priority
    fill_in "Revision", with: @empire_course_revision.revision
    fill_in "State", with: @empire_course_revision.state
    fill_in "Status", with: @empire_course_revision.status
    fill_in "Upgrades", with: @empire_course_revision.upgrades
    click_on "Create Empire course revision"

    assert_text "Empire course revision was successfully created"
    click_on "Back"
  end

  test "updating a Empire course revision" do
    visit empire_course_revisions_url
    click_on "Edit", match: :first

    fill_in "Course", with: @empire_course_revision.course
    fill_in "Course number", with: @empire_course_revision.course_number
    fill_in "Course type", with: @empire_course_revision.course_type
    fill_in "Hour", with: @empire_course_revision.hour
    fill_in "Note", with: @empire_course_revision.note
    fill_in "Priority", with: @empire_course_revision.priority
    fill_in "Revision", with: @empire_course_revision.revision
    fill_in "State", with: @empire_course_revision.state
    fill_in "Status", with: @empire_course_revision.status
    fill_in "Upgrades", with: @empire_course_revision.upgrades
    click_on "Update Empire course revision"

    assert_text "Empire course revision was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire course revision" do
    visit empire_course_revisions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire course revision was successfully destroyed"
  end
end
