require "application_system_test_case"

class CoursesPacificsTest < ApplicationSystemTestCase
  setup do
    @courses_pacific = courses_pacifics(:one)
  end

  test "visiting the index" do
    visit courses_pacifics_url
    assert_selector "h1", text: "Courses Pacifics"
  end

  test "creating a Courses pacific" do
    visit courses_pacifics_url
    click_on "New Courses Pacific"

    check "Active" if @courses_pacific.active
    fill_in "Category", with: @courses_pacific.category
    check "Exam" if @courses_pacific.exam
    fill_in "Hours", with: @courses_pacific.hours
    check "New" if @courses_pacific.new
    fill_in "Notes", with: @courses_pacific.notes
    fill_in "Number", with: @courses_pacific.number
    fill_in "Pub date", with: @courses_pacific.pub_date
    fill_in "Sequoia number", with: @courses_pacific.sequoia_number
    fill_in "Sequoia version", with: @courses_pacific.sequoia_version
    fill_in "Sub category", with: @courses_pacific.sub_category
    check "Text" if @courses_pacific.text
    fill_in "Title", with: @courses_pacific.title
    check "Update sheet" if @courses_pacific.update_sheet
    fill_in "Version", with: @courses_pacific.version
    check "Version update" if @courses_pacific.version_update
    click_on "Create Courses pacific"

    assert_text "Courses pacific was successfully created"
    click_on "Back"
  end

  test "updating a Courses pacific" do
    visit courses_pacifics_url
    click_on "Edit", match: :first

    check "Active" if @courses_pacific.active
    fill_in "Category", with: @courses_pacific.category
    check "Exam" if @courses_pacific.exam
    fill_in "Hours", with: @courses_pacific.hours
    check "New" if @courses_pacific.new
    fill_in "Notes", with: @courses_pacific.notes
    fill_in "Number", with: @courses_pacific.number
    fill_in "Pub date", with: @courses_pacific.pub_date
    fill_in "Sequoia number", with: @courses_pacific.sequoia_number
    fill_in "Sequoia version", with: @courses_pacific.sequoia_version
    fill_in "Sub category", with: @courses_pacific.sub_category
    check "Text" if @courses_pacific.text
    fill_in "Title", with: @courses_pacific.title
    check "Update sheet" if @courses_pacific.update_sheet
    fill_in "Version", with: @courses_pacific.version
    check "Version update" if @courses_pacific.version_update
    click_on "Update Courses pacific"

    assert_text "Courses pacific was successfully updated"
    click_on "Back"
  end

  test "destroying a Courses pacific" do
    visit courses_pacifics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Courses pacific was successfully destroyed"
  end
end
