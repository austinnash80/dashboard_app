require "application_system_test_case"

class NoMailNotFoundsTest < ApplicationSystemTestCase
  setup do
    @no_mail_not_found = no_mail_not_founds(:one)
  end

  test "visiting the index" do
    visit no_mail_not_founds_url
    assert_selector "h1", text: "No Mail Not Founds"
  end

  test "creating a No mail not found" do
    visit no_mail_not_founds_url
    click_on "New No Mail Not Found"

    fill_in "Add", with: @no_mail_not_found.add
    fill_in "Add2", with: @no_mail_not_found.add2
    fill_in "City", with: @no_mail_not_found.city
    fill_in "Co", with: @no_mail_not_found.co
    fill_in "Company", with: @no_mail_not_found.company
    fill_in "Des", with: @no_mail_not_found.des
    fill_in "Fname", with: @no_mail_not_found.fname
    fill_in "Lic state", with: @no_mail_not_found.lic_state
    fill_in "Lname", with: @no_mail_not_found.lname
    fill_in "Mi", with: @no_mail_not_found.mi
    fill_in "Note", with: @no_mail_not_found.note
    fill_in "State", with: @no_mail_not_found.state
    fill_in "Suf", with: @no_mail_not_found.suf
    fill_in "Zip", with: @no_mail_not_found.zip
    click_on "Create No mail not found"

    assert_text "No mail not found was successfully created"
    click_on "Back"
  end

  test "updating a No mail not found" do
    visit no_mail_not_founds_url
    click_on "Edit", match: :first

    fill_in "Add", with: @no_mail_not_found.add
    fill_in "Add2", with: @no_mail_not_found.add2
    fill_in "City", with: @no_mail_not_found.city
    fill_in "Co", with: @no_mail_not_found.co
    fill_in "Company", with: @no_mail_not_found.company
    fill_in "Des", with: @no_mail_not_found.des
    fill_in "Fname", with: @no_mail_not_found.fname
    fill_in "Lic state", with: @no_mail_not_found.lic_state
    fill_in "Lname", with: @no_mail_not_found.lname
    fill_in "Mi", with: @no_mail_not_found.mi
    fill_in "Note", with: @no_mail_not_found.note
    fill_in "State", with: @no_mail_not_found.state
    fill_in "Suf", with: @no_mail_not_found.suf
    fill_in "Zip", with: @no_mail_not_found.zip
    click_on "Update No mail not found"

    assert_text "No mail not found was successfully updated"
    click_on "Back"
  end

  test "destroying a No mail not found" do
    visit no_mail_not_founds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "No mail not found was successfully destroyed"
  end
end
