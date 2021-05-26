require "application_system_test_case"

class EmpireMasterDoubleAccountsTest < ApplicationSystemTestCase
  setup do
    @empire_master_double_account = empire_master_double_accounts(:one)
  end

  test "visiting the index" do
    visit empire_master_double_accounts_url
    assert_selector "h1", text: "Empire Master Double Accounts"
  end

  test "creating a Empire master double account" do
    visit empire_master_double_accounts_url
    click_on "New Empire Master Double Account"

    fill_in "Lic st", with: @empire_master_double_account.lic_st
    fill_in "List", with: @empire_master_double_account.list
    fill_in "Lname", with: @empire_master_double_account.lname
    fill_in "Search date", with: @empire_master_double_account.search_date
    fill_in "Uid", with: @empire_master_double_account.uid
    click_on "Create Empire master double account"

    assert_text "Empire master double account was successfully created"
    click_on "Back"
  end

  test "updating a Empire master double account" do
    visit empire_master_double_accounts_url
    click_on "Edit", match: :first

    fill_in "Lic st", with: @empire_master_double_account.lic_st
    fill_in "List", with: @empire_master_double_account.list
    fill_in "Lname", with: @empire_master_double_account.lname
    fill_in "Search date", with: @empire_master_double_account.search_date
    fill_in "Uid", with: @empire_master_double_account.uid
    click_on "Update Empire master double account"

    assert_text "Empire master double account was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master double account" do
    visit empire_master_double_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master double account was successfully destroyed"
  end
end
