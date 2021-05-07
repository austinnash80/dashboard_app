require "application_system_test_case"

class MasterCpaNoMailsTest < ApplicationSystemTestCase
  setup do
    @master_cpa_no_mail = master_cpa_no_mails(:one)
  end

  test "visiting the index" do
    visit master_cpa_no_mails_url
    assert_selector "h1", text: "Master Cpa No Mails"
  end

  test "creating a Master cpa no mail" do
    visit master_cpa_no_mails_url
    click_on "New Master Cpa No Mail"

    fill_in "Lid", with: @master_cpa_no_mail.lid
    fill_in "List", with: @master_cpa_no_mail.list
    fill_in "Lname", with: @master_cpa_no_mail.lname
    fill_in "Search date", with: @master_cpa_no_mail.search_date
    click_on "Create Master cpa no mail"

    assert_text "Master cpa no mail was successfully created"
    click_on "Back"
  end

  test "updating a Master cpa no mail" do
    visit master_cpa_no_mails_url
    click_on "Edit", match: :first

    fill_in "Lid", with: @master_cpa_no_mail.lid
    fill_in "List", with: @master_cpa_no_mail.list
    fill_in "Lname", with: @master_cpa_no_mail.lname
    fill_in "Search date", with: @master_cpa_no_mail.search_date
    click_on "Update Master cpa no mail"

    assert_text "Master cpa no mail was successfully updated"
    click_on "Back"
  end

  test "destroying a Master cpa no mail" do
    visit master_cpa_no_mails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master cpa no mail was successfully destroyed"
  end
end
