require "application_system_test_case"

class MasterEaNoMailsTest < ApplicationSystemTestCase
  setup do
    @master_ea_no_mail = master_ea_no_mails(:one)
  end

  test "visiting the index" do
    visit master_ea_no_mails_url
    assert_selector "h1", text: "Master Ea No Mails"
  end

  test "creating a Master ea no mail" do
    visit master_ea_no_mails_url
    click_on "New Master Ea No Mail"

    fill_in "Lid", with: @master_ea_no_mail.lid
    fill_in "List", with: @master_ea_no_mail.list
    fill_in "Lname", with: @master_ea_no_mail.lname
    fill_in "Search date", with: @master_ea_no_mail.search_date
    click_on "Create Master ea no mail"

    assert_text "Master ea no mail was successfully created"
    click_on "Back"
  end

  test "updating a Master ea no mail" do
    visit master_ea_no_mails_url
    click_on "Edit", match: :first

    fill_in "Lid", with: @master_ea_no_mail.lid
    fill_in "List", with: @master_ea_no_mail.list
    fill_in "Lname", with: @master_ea_no_mail.lname
    fill_in "Search date", with: @master_ea_no_mail.search_date
    click_on "Update Master ea no mail"

    assert_text "Master ea no mail was successfully updated"
    click_on "Back"
  end

  test "destroying a Master ea no mail" do
    visit master_ea_no_mails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master ea no mail was successfully destroyed"
  end
end
