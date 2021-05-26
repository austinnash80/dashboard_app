require "application_system_test_case"

class EmpireMasterNoMatchesTest < ApplicationSystemTestCase
  setup do
    @empire_master_no_match = empire_master_no_matches(:one)
  end

  test "visiting the index" do
    visit empire_master_no_matches_url
    assert_selector "h1", text: "Empire Master No Matches"
  end

  test "creating a Empire master no match" do
    visit empire_master_no_matches_url
    click_on "New Empire Master No Match"

    fill_in "Lic st", with: @empire_master_no_match.lic_st
    fill_in "Lid", with: @empire_master_no_match.lid
    fill_in "List", with: @empire_master_no_match.list
    fill_in "Search date", with: @empire_master_no_match.search_date
    click_on "Create Empire master no match"

    assert_text "Empire master no match was successfully created"
    click_on "Back"
  end

  test "updating a Empire master no match" do
    visit empire_master_no_matches_url
    click_on "Edit", match: :first

    fill_in "Lic st", with: @empire_master_no_match.lic_st
    fill_in "Lid", with: @empire_master_no_match.lid
    fill_in "List", with: @empire_master_no_match.list
    fill_in "Search date", with: @empire_master_no_match.search_date
    click_on "Update Empire master no match"

    assert_text "Empire master no match was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master no match" do
    visit empire_master_no_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master no match was successfully destroyed"
  end
end
