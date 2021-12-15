require "application_system_test_case"

class EmpireStateTasksSupplimentsTest < ApplicationSystemTestCase
  setup do
    @empire_state_tasks_suppliment = empire_state_tasks_suppliments(:one)
  end

  test "visiting the index" do
    visit empire_state_tasks_suppliments_url
    assert_selector "h1", text: "Empire State Tasks Suppliments"
  end

  test "creating a Empire state tasks suppliment" do
    visit empire_state_tasks_suppliments_url
    click_on "New Empire State Tasks Suppliment"

    fill_in "Step name", with: @empire_state_tasks_suppliment.step_name
    fill_in "Step number", with: @empire_state_tasks_suppliment.step_number
    click_on "Create Empire state tasks suppliment"

    assert_text "Empire state tasks suppliment was successfully created"
    click_on "Back"
  end

  test "updating a Empire state tasks suppliment" do
    visit empire_state_tasks_suppliments_url
    click_on "Edit", match: :first

    fill_in "Step name", with: @empire_state_tasks_suppliment.step_name
    fill_in "Step number", with: @empire_state_tasks_suppliment.step_number
    click_on "Update Empire state tasks suppliment"

    assert_text "Empire state tasks suppliment was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire state tasks suppliment" do
    visit empire_state_tasks_suppliments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire state tasks suppliment was successfully destroyed"
  end
end
