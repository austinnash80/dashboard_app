require "test_helper"

class SequoiaStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequoia_state = sequoia_states(:one)
  end

  test "should get index" do
    get sequoia_states_url
    assert_response :success
  end

  test "should get new" do
    get new_sequoia_state_url
    assert_response :success
  end

  test "should create sequoia_state" do
    assert_difference('SequoiaState.count') do
      post sequoia_states_url, params: { sequoia_state: { ce_cycle: @sequoia_state.ce_cycle, ce_due: @sequoia_state.ce_due, exp_cycle: @sequoia_state.exp_cycle, exp_date: @sequoia_state.exp_date, has_year_minimum: @sequoia_state.has_year_minimum, hours_per_cycle: @sequoia_state.hours_per_cycle, list: @sequoia_state.list, list_quantity: @sequoia_state.list_quantity, market_share: @sequoia_state.market_share, matched: @sequoia_state.matched, self_study: @sequoia_state.self_study, st: @sequoia_state.st, state: @sequoia_state.state, year_minimum: @sequoia_state.year_minimum } }
    end

    assert_redirected_to sequoia_state_url(SequoiaState.last)
  end

  test "should show sequoia_state" do
    get sequoia_state_url(@sequoia_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequoia_state_url(@sequoia_state)
    assert_response :success
  end

  test "should update sequoia_state" do
    patch sequoia_state_url(@sequoia_state), params: { sequoia_state: { ce_cycle: @sequoia_state.ce_cycle, ce_due: @sequoia_state.ce_due, exp_cycle: @sequoia_state.exp_cycle, exp_date: @sequoia_state.exp_date, has_year_minimum: @sequoia_state.has_year_minimum, hours_per_cycle: @sequoia_state.hours_per_cycle, list: @sequoia_state.list, list_quantity: @sequoia_state.list_quantity, market_share: @sequoia_state.market_share, matched: @sequoia_state.matched, self_study: @sequoia_state.self_study, st: @sequoia_state.st, state: @sequoia_state.state, year_minimum: @sequoia_state.year_minimum } }
    assert_redirected_to sequoia_state_url(@sequoia_state)
  end

  test "should destroy sequoia_state" do
    assert_difference('SequoiaState.count', -1) do
      delete sequoia_state_url(@sequoia_state)
    end

    assert_redirected_to sequoia_states_url
  end
end
