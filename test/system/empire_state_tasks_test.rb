require "application_system_test_case"

class EmpireStateTasksTest < ApplicationSystemTestCase
  setup do
    @empire_state_task = empire_state_tasks(:one)
  end

  test "visiting the index" do
    visit empire_state_tasks_url
    assert_selector "h1", text: "Empire State Tasks"
  end

  test "creating a Empire state task" do
    visit empire_state_tasks_url
    click_on "New Empire State Task"

    fill_in "Assigned", with: @empire_state_task.assigned
    check "Completed" if @empire_state_task.completed
    fill_in "Completed date", with: @empire_state_task.completed_date
    fill_in "Details", with: @empire_state_task.details
    fill_in "Due date", with: @empire_state_task.due_date
    fill_in "Empire state", with: @empire_state_task.empire_state_id
    fill_in "Step name", with: @empire_state_task.step_name
    fill_in "Step number", with: @empire_state_task.step_number
    fill_in "Task notes", with: @empire_state_task.task_notes
    click_on "Create Empire state task"

    assert_text "Empire state task was successfully created"
    click_on "Back"
  end

  test "updating a Empire state task" do
    visit empire_state_tasks_url
    click_on "Edit", match: :first

    fill_in "Assigned", with: @empire_state_task.assigned
    check "Completed" if @empire_state_task.completed
    fill_in "Completed date", with: @empire_state_task.completed_date
    fill_in "Details", with: @empire_state_task.details
    fill_in "Due date", with: @empire_state_task.due_date
    fill_in "Empire state", with: @empire_state_task.empire_state_id
    fill_in "Step name", with: @empire_state_task.step_name
    fill_in "Step number", with: @empire_state_task.step_number
    fill_in "Task notes", with: @empire_state_task.task_notes
    click_on "Update Empire state task"

    assert_text "Empire state task was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire state task" do
    visit empire_state_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire state task was successfully destroyed"
  end
end
