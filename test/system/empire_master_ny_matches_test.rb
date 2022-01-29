require "application_system_test_case"

class EmpireMasterNyMatchesTest < ApplicationSystemTestCase
  setup do
    @empire_master_ny_match = empire_master_ny_matches(:one)
  end

  test "visiting the index" do
    visit empire_master_ny_matches_url
    assert_selector "h1", text: "Empire Master Ny Matches"
  end

  test "creating a Empire master ny match" do
    visit empire_master_ny_matches_url
    click_on "New Empire Master Ny Match"

    fill_in "Exp", with: @empire_master_ny_match.exp
    fill_in "Lic", with: @empire_master_ny_match.lic
    fill_in "Lid", with: @empire_master_ny_match.lid
    fill_in "List", with: @empire_master_ny_match.list
    fill_in "Lname", with: @empire_master_ny_match.lname
    fill_in "Search date", with: @empire_master_ny_match.search_date
    fill_in "St", with: @empire_master_ny_match.st
    fill_in "Uid", with: @empire_master_ny_match.uid
    click_on "Create Empire master ny match"

    assert_text "Empire master ny match was successfully created"
    click_on "Back"
  end

  test "updating a Empire master ny match" do
    visit empire_master_ny_matches_url
    click_on "Edit", match: :first

    fill_in "Exp", with: @empire_master_ny_match.exp
    fill_in "Lic", with: @empire_master_ny_match.lic
    fill_in "Lid", with: @empire_master_ny_match.lid
    fill_in "List", with: @empire_master_ny_match.list
    fill_in "Lname", with: @empire_master_ny_match.lname
    fill_in "Search date", with: @empire_master_ny_match.search_date
    fill_in "St", with: @empire_master_ny_match.st
    fill_in "Uid", with: @empire_master_ny_match.uid
    click_on "Update Empire master ny match"

    assert_text "Empire master ny match was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master ny match" do
    visit empire_master_ny_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master ny match was successfully destroyed"
  end
end
