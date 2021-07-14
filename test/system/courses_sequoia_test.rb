require "application_system_test_case"

class CoursesSequoiaTest < ApplicationSystemTestCase
  setup do
    @courses_sequoium = courses_sequoia(:one)
  end

  test "visiting the index" do
    visit courses_sequoia_url
    assert_selector "h1", text: "Courses Sequoia"
  end

  test "creating a Courses sequoium" do
    visit courses_sequoia_url
    click_on "New Courses Sequoium"

    check "Active" if @courses_sequoium.active
    fill_in "Category", with: @courses_sequoium.category
    check "Exam" if @courses_sequoium.exam
    fill_in "Hours", with: @courses_sequoium.hours
    fill_in "Notes", with: @courses_sequoium.notes
    fill_in "Number", with: @courses_sequoium.number
    fill_in "Pes number", with: @courses_sequoium.pes_number
    fill_in "Pes version", with: @courses_sequoium.pes_version
    fill_in "Pub date", with: @courses_sequoium.pub_date
    fill_in "Sub category", with: @courses_sequoium.sub_category
    check "Text" if @courses_sequoium.text
    fill_in "Title", with: @courses_sequoium.title
    fill_in "Version", with: @courses_sequoium.version
    click_on "Create Courses sequoium"

    assert_text "Courses sequoium was successfully created"
    click_on "Back"
  end

  test "updating a Courses sequoium" do
    visit courses_sequoia_url
    click_on "Edit", match: :first

    check "Active" if @courses_sequoium.active
    fill_in "Category", with: @courses_sequoium.category
    check "Exam" if @courses_sequoium.exam
    fill_in "Hours", with: @courses_sequoium.hours
    fill_in "Notes", with: @courses_sequoium.notes
    fill_in "Number", with: @courses_sequoium.number
    fill_in "Pes number", with: @courses_sequoium.pes_number
    fill_in "Pes version", with: @courses_sequoium.pes_version
    fill_in "Pub date", with: @courses_sequoium.pub_date
    fill_in "Sub category", with: @courses_sequoium.sub_category
    check "Text" if @courses_sequoium.text
    fill_in "Title", with: @courses_sequoium.title
    fill_in "Version", with: @courses_sequoium.version
    click_on "Update Courses sequoium"

    assert_text "Courses sequoium was successfully updated"
    click_on "Back"
  end

  test "destroying a Courses sequoium" do
    visit courses_sequoia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Courses sequoium was successfully destroyed"
  end
end
