require "application_system_test_case"

class EmpireMasterMatchesTest < ApplicationSystemTestCase
  setup do
    @empire_master_match = empire_master_matches(:one)
  end

  test "visiting the index" do
    visit empire_master_matches_url
    assert_selector "h1", text: "Empire Master Matches"
  end

  test "creating a Empire master match" do
    visit empire_master_matches_url
    click_on "New Empire Master Match"

    fill_in "Lic st", with: @empire_master_match.lic_st
    fill_in "Lid", with: @empire_master_match.lid
    fill_in "List", with: @empire_master_match.list
    fill_in "Search date", with: @empire_master_match.search_date
    fill_in "Uid", with: @empire_master_match.uid
    click_on "Create Empire master match"

    assert_text "Empire master match was successfully created"
    click_on "Back"
  end

  test "updating a Empire master match" do
    visit empire_master_matches_url
    click_on "Edit", match: :first

    fill_in "Lic st", with: @empire_master_match.lic_st
    fill_in "Lid", with: @empire_master_match.lid
    fill_in "List", with: @empire_master_match.list
    fill_in "Search date", with: @empire_master_match.search_date
    fill_in "Uid", with: @empire_master_match.uid
    click_on "Update Empire master match"

    assert_text "Empire master match was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master match" do
    visit empire_master_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master match was successfully destroyed"
  end
end
