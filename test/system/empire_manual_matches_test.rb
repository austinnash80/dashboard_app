require "application_system_test_case"

class EmpireManualMatchesTest < ApplicationSystemTestCase
  setup do
    @empire_manual_match = empire_manual_matches(:one)
  end

  test "visiting the index" do
    visit empire_manual_matches_url
    assert_selector "h1", text: "Empire Manual Matches"
  end

  test "creating a Empire manual match" do
    visit empire_manual_matches_url
    click_on "New Empire Manual Match"

    fill_in "Lic", with: @empire_manual_match.lic
    fill_in "Lid", with: @empire_manual_match.lid
    fill_in "List", with: @empire_manual_match.list
    fill_in "Lname", with: @empire_manual_match.lname
    check "Match" if @empire_manual_match.match
    fill_in "Uid", with: @empire_manual_match.uid
    click_on "Create Empire manual match"

    assert_text "Empire manual match was successfully created"
    click_on "Back"
  end

  test "updating a Empire manual match" do
    visit empire_manual_matches_url
    click_on "Edit", match: :first

    fill_in "Lic", with: @empire_manual_match.lic
    fill_in "Lid", with: @empire_manual_match.lid
    fill_in "List", with: @empire_manual_match.list
    fill_in "Lname", with: @empire_manual_match.lname
    check "Match" if @empire_manual_match.match
    fill_in "Uid", with: @empire_manual_match.uid
    click_on "Update Empire manual match"

    assert_text "Empire manual match was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire manual match" do
    visit empire_manual_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire manual match was successfully destroyed"
  end
end
