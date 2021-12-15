require "test_helper"

class EmpireStateTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_state_task = empire_state_tasks(:one)
  end

  test "should get index" do
    get empire_state_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_state_task_url
    assert_response :success
  end

  test "should create empire_state_task" do
    assert_difference('EmpireStateTask.count') do
      post empire_state_tasks_url, params: { empire_state_task: { assigned: @empire_state_task.assigned, completed: @empire_state_task.completed, completed_date: @empire_state_task.completed_date, details: @empire_state_task.details, due_date: @empire_state_task.due_date, empire_state_id: @empire_state_task.empire_state_id, step_name: @empire_state_task.step_name, step_number: @empire_state_task.step_number, task_notes: @empire_state_task.task_notes } }
    end

    assert_redirected_to empire_state_task_url(EmpireStateTask.last)
  end

  test "should show empire_state_task" do
    get empire_state_task_url(@empire_state_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_state_task_url(@empire_state_task)
    assert_response :success
  end

  test "should update empire_state_task" do
    patch empire_state_task_url(@empire_state_task), params: { empire_state_task: { assigned: @empire_state_task.assigned, completed: @empire_state_task.completed, completed_date: @empire_state_task.completed_date, details: @empire_state_task.details, due_date: @empire_state_task.due_date, empire_state_id: @empire_state_task.empire_state_id, step_name: @empire_state_task.step_name, step_number: @empire_state_task.step_number, task_notes: @empire_state_task.task_notes } }
    assert_redirected_to empire_state_task_url(@empire_state_task)
  end

  test "should destroy empire_state_task" do
    assert_difference('EmpireStateTask.count', -1) do
      delete empire_state_task_url(@empire_state_task)
    end

    assert_redirected_to empire_state_tasks_url
  end
end
