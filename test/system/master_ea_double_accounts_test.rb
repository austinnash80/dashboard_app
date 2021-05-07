require "application_system_test_case"

class MasterEaDoubleAccountsTest < ApplicationSystemTestCase
  setup do
    @master_ea_double_account = master_ea_double_accounts(:one)
  end

  test "visiting the index" do
    visit master_ea_double_accounts_url
    assert_selector "h1", text: "Master Ea Double Accounts"
  end

  test "creating a Master ea double account" do
    visit master_ea_double_accounts_url
    click_on "New Master Ea Double Account"

    fill_in "Lid", with: @master_ea_double_account.lid
    fill_in "List", with: @master_ea_double_account.list
    fill_in "Lname", with: @master_ea_double_account.lname
    fill_in "Search date", with: @master_ea_double_account.search_date
    fill_in "Uid", with: @master_ea_double_account.uid
    click_on "Create Master ea double account"

    assert_text "Master ea double account was successfully created"
    click_on "Back"
  end

  test "updating a Master ea double account" do
    visit master_ea_double_accounts_url
    click_on "Edit", match: :first

    fill_in "Lid", with: @master_ea_double_account.lid
    fill_in "List", with: @master_ea_double_account.list
    fill_in "Lname", with: @master_ea_double_account.lname
    fill_in "Search date", with: @master_ea_double_account.search_date
    fill_in "Uid", with: @master_ea_double_account.uid
    click_on "Update Master ea double account"

    assert_text "Master ea double account was successfully updated"
    click_on "Back"
  end

  test "destroying a Master ea double account" do
    visit master_ea_double_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master ea double account was successfully destroyed"
  end
end
