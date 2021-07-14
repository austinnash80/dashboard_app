require "application_system_test_case"

class CoursesPesTest < ApplicationSystemTestCase
  setup do
    @courses_pe = courses_pes(:one)
  end

  test "visiting the index" do
    visit courses_pes_url
    assert_selector "h1", text: "Courses Pes"
  end

  test "creating a Courses pe" do
    visit courses_pes_url
    click_on "New Courses Pe"

    fill_in "Category", with: @courses_pe.category
    fill_in "Hours", with: @courses_pe.hours
    check "New" if @courses_pe.new
    fill_in "Notes", with: @courses_pe.notes
    fill_in "Number", with: @courses_pe.number
    fill_in "Pub date", with: @courses_pe.pub_date
    fill_in "Sub category", with: @courses_pe.sub_category
    fill_in "Title", with: @courses_pe.title
    check "Update" if @courses_pe.update
    fill_in "Version", with: @courses_pe.version
    click_on "Create Courses pe"

    assert_text "Courses pe was successfully created"
    click_on "Back"
  end

  test "updating a Courses pe" do
    visit courses_pes_url
    click_on "Edit", match: :first

    fill_in "Category", with: @courses_pe.category
    fill_in "Hours", with: @courses_pe.hours
    check "New" if @courses_pe.new
    fill_in "Notes", with: @courses_pe.notes
    fill_in "Number", with: @courses_pe.number
    fill_in "Pub date", with: @courses_pe.pub_date
    fill_in "Sub category", with: @courses_pe.sub_category
    fill_in "Title", with: @courses_pe.title
    check "Update" if @courses_pe.update
    fill_in "Version", with: @courses_pe.version
    click_on "Update Courses pe"

    assert_text "Courses pe was successfully updated"
    click_on "Back"
  end

  test "destroying a Courses pe" do
    visit courses_pes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Courses pe was successfully destroyed"
  end
end
