require "application_system_test_case"

class MasterEaNoMatchesTest < ApplicationSystemTestCase
  setup do
    @master_ea_no_match = master_ea_no_matches(:one)
  end

  test "visiting the index" do
    visit master_ea_no_matches_url
    assert_selector "h1", text: "Master Ea No Matches"
  end

  test "creating a Master ea no match" do
    visit master_ea_no_matches_url
    click_on "New Master Ea No Match"

    fill_in "List", with: @master_ea_no_match.list
    fill_in "Lname", with: @master_ea_no_match.lname
    fill_in "Search date", with: @master_ea_no_match.search_date
    fill_in "Uid", with: @master_ea_no_match.uid
    click_on "Create Master ea no match"

    assert_text "Master ea no match was successfully created"
    click_on "Back"
  end

  test "updating a Master ea no match" do
    visit master_ea_no_matches_url
    click_on "Edit", match: :first

    fill_in "List", with: @master_ea_no_match.list
    fill_in "Lname", with: @master_ea_no_match.lname
    fill_in "Search date", with: @master_ea_no_match.search_date
    fill_in "Uid", with: @master_ea_no_match.uid
    click_on "Update Master ea no match"

    assert_text "Master ea no match was successfully updated"
    click_on "Back"
  end

  test "destroying a Master ea no match" do
    visit master_ea_no_matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master ea no match was successfully destroyed"
  end
end
