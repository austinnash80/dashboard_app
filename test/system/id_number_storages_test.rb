require "application_system_test_case"

class IdNumberStoragesTest < ApplicationSystemTestCase
  setup do
    @id_number_storage = id_number_storages(:one)
  end

  test "visiting the index" do
    visit id_number_storages_url
    assert_selector "h1", text: "Id Number Storages"
  end

  test "creating a Id number storage" do
    visit id_number_storages_url
    click_on "New Id Number Storage"

    fill_in "Sequoia members order", with: @id_number_storage.sequoia_members_order_id
    click_on "Create Id number storage"

    assert_text "Id number storage was successfully created"
    click_on "Back"
  end

  test "updating a Id number storage" do
    visit id_number_storages_url
    click_on "Edit", match: :first

    fill_in "Sequoia members order", with: @id_number_storage.sequoia_members_order_id
    click_on "Update Id number storage"

    assert_text "Id number storage was successfully updated"
    click_on "Back"
  end

  test "destroying a Id number storage" do
    visit id_number_storages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Id number storage was successfully destroyed"
  end
end
