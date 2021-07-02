require "application_system_test_case"

class SequoiaStatesTest < ApplicationSystemTestCase
  setup do
    @sequoia_state = sequoia_states(:one)
  end

  test "visiting the index" do
    visit sequoia_states_url
    assert_selector "h1", text: "Sequoia States"
  end

  test "creating a Sequoia state" do
    visit sequoia_states_url
    click_on "New Sequoia State"

    fill_in "Ce cycle", with: @sequoia_state.ce_cycle
    fill_in "Ce due", with: @sequoia_state.ce_due
    fill_in "Exp cycle", with: @sequoia_state.exp_cycle
    fill_in "Exp date", with: @sequoia_state.exp_date
    check "Has year minimum" if @sequoia_state.has_year_minimum
    fill_in "Hours per cycle", with: @sequoia_state.hours_per_cycle
    fill_in "List", with: @sequoia_state.list
    fill_in "List quantity", with: @sequoia_state.list_quantity
    fill_in "Market share", with: @sequoia_state.market_share
    fill_in "Matched", with: @sequoia_state.matched
    fill_in "Self study", with: @sequoia_state.self_study
    fill_in "St", with: @sequoia_state.st
    fill_in "State", with: @sequoia_state.state
    fill_in "Year minimum", with: @sequoia_state.year_minimum
    click_on "Create Sequoia state"

    assert_text "Sequoia state was successfully created"
    click_on "Back"
  end

  test "updating a Sequoia state" do
    visit sequoia_states_url
    click_on "Edit", match: :first

    fill_in "Ce cycle", with: @sequoia_state.ce_cycle
    fill_in "Ce due", with: @sequoia_state.ce_due
    fill_in "Exp cycle", with: @sequoia_state.exp_cycle
    fill_in "Exp date", with: @sequoia_state.exp_date
    check "Has year minimum" if @sequoia_state.has_year_minimum
    fill_in "Hours per cycle", with: @sequoia_state.hours_per_cycle
    fill_in "List", with: @sequoia_state.list
    fill_in "List quantity", with: @sequoia_state.list_quantity
    fill_in "Market share", with: @sequoia_state.market_share
    fill_in "Matched", with: @sequoia_state.matched
    fill_in "Self study", with: @sequoia_state.self_study
    fill_in "St", with: @sequoia_state.st
    fill_in "State", with: @sequoia_state.state
    fill_in "Year minimum", with: @sequoia_state.year_minimum
    click_on "Update Sequoia state"

    assert_text "Sequoia state was successfully updated"
    click_on "Back"
  end

  test "destroying a Sequoia state" do
    visit sequoia_states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sequoia state was successfully destroyed"
  end
end
