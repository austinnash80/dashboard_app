require "application_system_test_case"

class AutoRenewListsTest < ApplicationSystemTestCase
  setup do
    @auto_renew_list = auto_renew_lists(:one)
  end

  test "visiting the index" do
    visit auto_renew_lists_url
    assert_selector "h1", text: "Auto Renew Lists"
  end

  test "creating a Auto renew list" do
    visit auto_renew_lists_url
    click_on "New Auto Renew List"

    fill_in "Uid", with: @auto_renew_list.uid
    click_on "Create Auto renew list"

    assert_text "Auto renew list was successfully created"
    click_on "Back"
  end

  test "updating a Auto renew list" do
    visit auto_renew_lists_url
    click_on "Edit", match: :first

    fill_in "Uid", with: @auto_renew_list.uid
    click_on "Update Auto renew list"

    assert_text "Auto renew list was successfully updated"
    click_on "Back"
  end

  test "destroying a Auto renew list" do
    visit auto_renew_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Auto renew list was successfully destroyed"
  end
end
