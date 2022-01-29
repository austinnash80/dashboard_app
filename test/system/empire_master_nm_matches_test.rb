require "application_system_test_case"

class EmpireMasterNmMatchesTest < ApplicationSystemTestCase
  setup do
    @empire_master_nm_match = empire_master_nm_matches(:one)
  end

  test "visiting the index" do
    visit empire_master_nm_matches_url
    assert_selector "h1", text: "Empire Master Nm Matches"
  end

  test "creating a Empire master nm match" do
    visit empire_master_nm_matches_url
    click_on "New Empire Master Nm Match"

    fill_in "Exp", with: @empire_master_nm_match.exp
    fill_in "Lic", with: @empire_master_nm_match.lic
    fill_in "Lid", with: @empire_master_nm_match.lid
    fill_in "List", with: @empire_master_nm_match.list
    fill_in "Lname", with: @empire_master_nm_match.lname
    fill_in "Search date", with: @empire_master_nm_match.search_date
    fill_in "St", with: @empire_master_nm_match.st
    fill_in "Uid", with: @empire_master_nm_match.uid
    click_on "Create Empire master nm match"

    assert_text "Empire master nm match was successfully created"
    click_on "Back"
  end

  test "updating a Empire master nm match" do
    visit empire_master_nm_matches_url
    click_on "Edit", match: :first

    fill_in "Exp", with: @empire_master_nm_match.exp
    fill_in "Lic", with: @empire_master_nm_match.lic
    fill_in "Lid", with: @empire_master_nm_match.lid
    fill_in "List", with: @empire_master_nm_match.list
    fill_in "Lname", with: @empire_master_nm_match.lname
    fill_in "Search date", with: @empire_master_nm_match.search_date
    fill_in "St", with: @empire_master_nm_match.st
    fill_in "Uid", with: @empire_master_nm_match.uid
    click_on "Update Empire master nm match"

    assert_text "Empire master nm match was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master nm match" do
    visit empire_master_nm_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master nm match was successfully destroyed"
  end
end
