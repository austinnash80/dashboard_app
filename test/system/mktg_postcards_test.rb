require "application_system_test_case"

class MktgPostcardsTest < ApplicationSystemTestCase
  setup do
    @mktg_postcard = mktg_postcards(:one)
  end

  test "visiting the index" do
    visit mktg_postcards_url
    assert_selector "h1", text: "Mktg Postcards"
  end

  test "creating a Mktg postcard" do
    visit mktg_postcards_url
    click_on "New Mktg Postcard"

    fill_in "Campaign", with: @mktg_postcard.campaign
    fill_in "Company", with: @mktg_postcard.company
    fill_in "Cpa sent", with: @mktg_postcard.cpa_sent
    check "Done" if @mktg_postcard.done
    fill_in "Ea sent", with: @mktg_postcard.ea_sent
    fill_in "Mail day", with: @mktg_postcard.mail_day
    fill_in "Notes", with: @mktg_postcard.notes
    fill_in "Range 1 a", with: @mktg_postcard.range_1_a
    fill_in "Range 1 b", with: @mktg_postcard.range_1_b
    fill_in "Range 2 a", with: @mktg_postcard.range_2_a
    fill_in "Range 2 b", with: @mktg_postcard.range_2_b
    click_on "Create Mktg postcard"

    assert_text "Mktg postcard was successfully created"
    click_on "Back"
  end

  test "updating a Mktg postcard" do
    visit mktg_postcards_url
    click_on "Edit", match: :first

    fill_in "Campaign", with: @mktg_postcard.campaign
    fill_in "Company", with: @mktg_postcard.company
    fill_in "Cpa sent", with: @mktg_postcard.cpa_sent
    check "Done" if @mktg_postcard.done
    fill_in "Ea sent", with: @mktg_postcard.ea_sent
    fill_in "Mail day", with: @mktg_postcard.mail_day
    fill_in "Notes", with: @mktg_postcard.notes
    fill_in "Range 1 a", with: @mktg_postcard.range_1_a
    fill_in "Range 1 b", with: @mktg_postcard.range_1_b
    fill_in "Range 2 a", with: @mktg_postcard.range_2_a
    fill_in "Range 2 b", with: @mktg_postcard.range_2_b
    click_on "Update Mktg postcard"

    assert_text "Mktg postcard was successfully updated"
    click_on "Back"
  end

  test "destroying a Mktg postcard" do
    visit mktg_postcards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mktg postcard was successfully destroyed"
  end
end
