require "application_system_test_case"

class MktgExportsTest < ApplicationSystemTestCase
  setup do
    @mktg_export = mktg_exports(:one)
  end

  test "visiting the index" do
    visit mktg_exports_url
    assert_selector "h1", text: "Mktg Exports"
  end

  test "creating a Mktg export" do
    visit mktg_exports_url
    click_on "New Mktg Export"

    fill_in "Campaign", with: @mktg_export.campaign
    fill_in "City", with: @mktg_export.city
    fill_in "Des", with: @mktg_export.des
    fill_in "Exp", with: @mktg_export.exp
    fill_in "Fname", with: @mktg_export.fname
    fill_in "Lname", with: @mktg_export.lname
    fill_in "State", with: @mktg_export.state
    fill_in "Street 1", with: @mktg_export.street_1
    fill_in "Street 2", with: @mktg_export.street_2
    fill_in "Text 1", with: @mktg_export.text_1
    fill_in "Text 10", with: @mktg_export.text_10
    fill_in "Text 2", with: @mktg_export.text_2
    fill_in "Text 3", with: @mktg_export.text_3
    fill_in "Text 4", with: @mktg_export.text_4
    fill_in "Text 5", with: @mktg_export.text_5
    fill_in "Text 6", with: @mktg_export.text_6
    fill_in "Text 7", with: @mktg_export.text_7
    fill_in "Text 8", with: @mktg_export.text_8
    fill_in "Text 9", with: @mktg_export.text_9
    fill_in "Uid", with: @mktg_export.uid
    fill_in "Zip", with: @mktg_export.zip
    click_on "Create Mktg export"

    assert_text "Mktg export was successfully created"
    click_on "Back"
  end

  test "updating a Mktg export" do
    visit mktg_exports_url
    click_on "Edit", match: :first

    fill_in "Campaign", with: @mktg_export.campaign
    fill_in "City", with: @mktg_export.city
    fill_in "Des", with: @mktg_export.des
    fill_in "Exp", with: @mktg_export.exp
    fill_in "Fname", with: @mktg_export.fname
    fill_in "Lname", with: @mktg_export.lname
    fill_in "State", with: @mktg_export.state
    fill_in "Street 1", with: @mktg_export.street_1
    fill_in "Street 2", with: @mktg_export.street_2
    fill_in "Text 1", with: @mktg_export.text_1
    fill_in "Text 10", with: @mktg_export.text_10
    fill_in "Text 2", with: @mktg_export.text_2
    fill_in "Text 3", with: @mktg_export.text_3
    fill_in "Text 4", with: @mktg_export.text_4
    fill_in "Text 5", with: @mktg_export.text_5
    fill_in "Text 6", with: @mktg_export.text_6
    fill_in "Text 7", with: @mktg_export.text_7
    fill_in "Text 8", with: @mktg_export.text_8
    fill_in "Text 9", with: @mktg_export.text_9
    fill_in "Uid", with: @mktg_export.uid
    fill_in "Zip", with: @mktg_export.zip
    click_on "Update Mktg export"

    assert_text "Mktg export was successfully updated"
    click_on "Back"
  end

  test "destroying a Mktg export" do
    visit mktg_exports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mktg export was successfully destroyed"
  end
end
