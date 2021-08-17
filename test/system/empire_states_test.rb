require "application_system_test_case"

class EmpireStatesTest < ApplicationSystemTestCase
  setup do
    @empire_state = empire_states(:one)
  end

  test "visiting the index" do
    visit empire_states_url
    assert_selector "h1", text: "Empire States"
  end

  test "creating a Empire state" do
    visit empire_states_url
    click_on "New Empire State"

    fill_in "Customers", with: @empire_state.customers
    fill_in "Exp notes", with: @empire_state.exp_notes
    fill_in "Exp type", with: @empire_state.exp_type
    fill_in "List cost", with: @empire_state.list_cost
    fill_in "List date", with: @empire_state.list_date
    fill_in "List notes", with: @empire_state.list_notes
    fill_in "List size", with: @empire_state.list_size
    fill_in "Matched customers", with: @empire_state.matched_customers
    fill_in "Next exp", with: @empire_state.next_exp
    fill_in "Renewal cycle", with: @empire_state.renewal_cycle
    fill_in "St", with: @empire_state.st
    fill_in "State", with: @empire_state.state
    click_on "Create Empire state"

    assert_text "Empire state was successfully created"
    click_on "Back"
  end

  test "updating a Empire state" do
    visit empire_states_url
    click_on "Edit", match: :first

    fill_in "Customers", with: @empire_state.customers
    fill_in "Exp notes", with: @empire_state.exp_notes
    fill_in "Exp type", with: @empire_state.exp_type
    fill_in "List cost", with: @empire_state.list_cost
    fill_in "List date", with: @empire_state.list_date
    fill_in "List notes", with: @empire_state.list_notes
    fill_in "List size", with: @empire_state.list_size
    fill_in "Matched customers", with: @empire_state.matched_customers
    fill_in "Next exp", with: @empire_state.next_exp
    fill_in "Renewal cycle", with: @empire_state.renewal_cycle
    fill_in "St", with: @empire_state.st
    fill_in "State", with: @empire_state.state
    click_on "Update Empire state"

    assert_text "Empire state was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire state" do
    visit empire_states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire state was successfully destroyed"
  end
end
