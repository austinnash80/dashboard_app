require "application_system_test_case"

class MasterCpaMatchesTest < ApplicationSystemTestCase
  setup do
    @master_cpa_match = master_cpa_matches(:one)
  end

  test "visiting the index" do
    visit master_cpa_matches_url
    assert_selector "h1", text: "Master Cpa Matches"
  end

  test "creating a Master cpa match" do
    visit master_cpa_matches_url
    click_on "New Master Cpa Match"

    fill_in "Lid", with: @master_cpa_match.lid
    fill_in "List", with: @master_cpa_match.list
    fill_in "Lname", with: @master_cpa_match.lname
    fill_in "Search date", with: @master_cpa_match.search_date
    fill_in "Uid", with: @master_cpa_match.uid
    click_on "Create Master cpa match"

    assert_text "Master cpa match was successfully created"
    click_on "Back"
  end

  test "updating a Master cpa match" do
    visit master_cpa_matches_url
    click_on "Edit", match: :first

    fill_in "Lid", with: @master_cpa_match.lid
    fill_in "List", with: @master_cpa_match.list
    fill_in "Lname", with: @master_cpa_match.lname
    fill_in "Search date", with: @master_cpa_match.search_date
    fill_in "Uid", with: @master_cpa_match.uid
    click_on "Update Master cpa match"

    assert_text "Master cpa match was successfully updated"
    click_on "Back"
  end

  test "destroying a Master cpa match" do
    visit master_cpa_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master cpa match was successfully destroyed"
  end
end
