require "test_helper"

class EmpireStateTasksSupplimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_state_tasks_suppliment = empire_state_tasks_suppliments(:one)
  end

  test "should get index" do
    get empire_state_tasks_suppliments_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_state_tasks_suppliment_url
    assert_response :success
  end

  test "should create empire_state_tasks_suppliment" do
    assert_difference('EmpireStateTasksSuppliment.count') do
      post empire_state_tasks_suppliments_url, params: { empire_state_tasks_suppliment: { step_name: @empire_state_tasks_suppliment.step_name, step_number: @empire_state_tasks_suppliment.step_number } }
    end

    assert_redirected_to empire_state_tasks_suppliment_url(EmpireStateTasksSuppliment.last)
  end

  test "should show empire_state_tasks_suppliment" do
    get empire_state_tasks_suppliment_url(@empire_state_tasks_suppliment)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_state_tasks_suppliment_url(@empire_state_tasks_suppliment)
    assert_response :success
  end

  test "should update empire_state_tasks_suppliment" do
    patch empire_state_tasks_suppliment_url(@empire_state_tasks_suppliment), params: { empire_state_tasks_suppliment: { step_name: @empire_state_tasks_suppliment.step_name, step_number: @empire_state_tasks_suppliment.step_number } }
    assert_redirected_to empire_state_tasks_suppliment_url(@empire_state_tasks_suppliment)
  end

  test "should destroy empire_state_tasks_suppliment" do
    assert_difference('EmpireStateTasksSuppliment.count', -1) do
      delete empire_state_tasks_suppliment_url(@empire_state_tasks_suppliment)
    end

    assert_redirected_to empire_state_tasks_suppliments_url
  end
end
