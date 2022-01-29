require "application_system_test_case"

class EmpireMasterGaMatchesTest < ApplicationSystemTestCase
  setup do
    @empire_master_ga_match = empire_master_ga_matches(:one)
  end

  test "visiting the index" do
    visit empire_master_ga_matches_url
    assert_selector "h1", text: "Empire Master Ga Matches"
  end

  test "creating a Empire master ga match" do
    visit empire_master_ga_matches_url
    click_on "New Empire Master Ga Match"

    fill_in "Exp", with: @empire_master_ga_match.exp
    fill_in "Lic", with: @empire_master_ga_match.lic
    fill_in "Lid", with: @empire_master_ga_match.lid
    fill_in "List", with: @empire_master_ga_match.list
    fill_in "Lname", with: @empire_master_ga_match.lname
    fill_in "Search date", with: @empire_master_ga_match.search_date
    fill_in "St", with: @empire_master_ga_match.st
    fill_in "Uid", with: @empire_master_ga_match.uid
    click_on "Create Empire master ga match"

    assert_text "Empire master ga match was successfully created"
    click_on "Back"
  end

  test "updating a Empire master ga match" do
    visit empire_master_ga_matches_url
    click_on "Edit", match: :first

    fill_in "Exp", with: @empire_master_ga_match.exp
    fill_in "Lic", with: @empire_master_ga_match.lic
    fill_in "Lid", with: @empire_master_ga_match.lid
    fill_in "List", with: @empire_master_ga_match.list
    fill_in "Lname", with: @empire_master_ga_match.lname
    fill_in "Search date", with: @empire_master_ga_match.search_date
    fill_in "St", with: @empire_master_ga_match.st
    fill_in "Uid", with: @empire_master_ga_match.uid
    click_on "Update Empire master ga match"

    assert_text "Empire master ga match was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master ga match" do
    visit empire_master_ga_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master ga match was successfully destroyed"
  end
end
