require "test_helper"

class EmpireStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_state = empire_states(:one)
  end

  test "should get index" do
    get empire_states_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_state_url
    assert_response :success
  end

  test "should create empire_state" do
    assert_difference('EmpireState.count') do
      post empire_states_url, params: { empire_state: { customers: @empire_state.customers, exp_notes: @empire_state.exp_notes, exp_type: @empire_state.exp_type, list_cost: @empire_state.list_cost, list_date: @empire_state.list_date, list_notes: @empire_state.list_notes, list_size: @empire_state.list_size, matched_customers: @empire_state.matched_customers, next_exp: @empire_state.next_exp, renewal_cycle: @empire_state.renewal_cycle, st: @empire_state.st, state: @empire_state.state } }
    end

    assert_redirected_to empire_state_url(EmpireState.last)
  end

  test "should show empire_state" do
    get empire_state_url(@empire_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_state_url(@empire_state)
    assert_response :success
  end

  test "should update empire_state" do
    patch empire_state_url(@empire_state), params: { empire_state: { customers: @empire_state.customers, exp_notes: @empire_state.exp_notes, exp_type: @empire_state.exp_type, list_cost: @empire_state.list_cost, list_date: @empire_state.list_date, list_notes: @empire_state.list_notes, list_size: @empire_state.list_size, matched_customers: @empire_state.matched_customers, next_exp: @empire_state.next_exp, renewal_cycle: @empire_state.renewal_cycle, st: @empire_state.st, state: @empire_state.state } }
    assert_redirected_to empire_state_url(@empire_state)
  end

  test "should destroy empire_state" do
    assert_difference('EmpireState.count', -1) do
      delete empire_state_url(@empire_state)
    end

    assert_redirected_to empire_states_url
  end
end
