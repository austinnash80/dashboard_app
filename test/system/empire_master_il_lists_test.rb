require "application_system_test_case"

class EmpireMasterIlListsTest < ApplicationSystemTestCase
  setup do
    @empire_master_il_list = empire_master_il_lists(:one)
  end

  test "visiting the index" do
    visit empire_master_il_lists_url
    assert_selector "h1", text: "Empire Master Il Lists"
  end

  test "creating a Empire master il list" do
    visit empire_master_il_lists_url
    click_on "New Empire Master Il List"

    fill_in "Add", with: @empire_master_il_list.add
    fill_in "Adds", with: @empire_master_il_list.adds
    fill_in "City", with: @empire_master_il_list.city
    fill_in "Co", with: @empire_master_il_list.co
    fill_in "Email", with: @empire_master_il_list.email
    fill_in "Exp date", with: @empire_master_il_list.exp_date
    fill_in "Exp date s", with: @empire_master_il_list.exp_date_s
    fill_in "Fname", with: @empire_master_il_list.fname
    fill_in "Iss date", with: @empire_master_il_list.iss_date
    fill_in "Iss date s", with: @empire_master_il_list.iss_date_s
    fill_in "Lic", with: @empire_master_il_list.lic
    fill_in "Lic state", with: @empire_master_il_list.lic_state
    fill_in "Lic status", with: @empire_master_il_list.lic_status
    fill_in "Lid", with: @empire_master_il_list.lid
    fill_in "List", with: @empire_master_il_list.list
    fill_in "Lname", with: @empire_master_il_list.lname
    fill_in "Mi", with: @empire_master_il_list.mi
    fill_in "Phone", with: @empire_master_il_list.phone
    fill_in "Record type", with: @empire_master_il_list.record_type
    fill_in "St", with: @empire_master_il_list.st
    fill_in "Suf", with: @empire_master_il_list.suf
    fill_in "Zip", with: @empire_master_il_list.zip
    click_on "Create Empire master il list"

    assert_text "Empire master il list was successfully created"
    click_on "Back"
  end

  test "updating a Empire master il list" do
    visit empire_master_il_lists_url
    click_on "Edit", match: :first

    fill_in "Add", with: @empire_master_il_list.add
    fill_in "Adds", with: @empire_master_il_list.adds
    fill_in "City", with: @empire_master_il_list.city
    fill_in "Co", with: @empire_master_il_list.co
    fill_in "Email", with: @empire_master_il_list.email
    fill_in "Exp date", with: @empire_master_il_list.exp_date
    fill_in "Exp date s", with: @empire_master_il_list.exp_date_s
    fill_in "Fname", with: @empire_master_il_list.fname
    fill_in "Iss date", with: @empire_master_il_list.iss_date
    fill_in "Iss date s", with: @empire_master_il_list.iss_date_s
    fill_in "Lic", with: @empire_master_il_list.lic
    fill_in "Lic state", with: @empire_master_il_list.lic_state
    fill_in "Lic status", with: @empire_master_il_list.lic_status
    fill_in "Lid", with: @empire_master_il_list.lid
    fill_in "List", with: @empire_master_il_list.list
    fill_in "Lname", with: @empire_master_il_list.lname
    fill_in "Mi", with: @empire_master_il_list.mi
    fill_in "Phone", with: @empire_master_il_list.phone
    fill_in "Record type", with: @empire_master_il_list.record_type
    fill_in "St", with: @empire_master_il_list.st
    fill_in "Suf", with: @empire_master_il_list.suf
    fill_in "Zip", with: @empire_master_il_list.zip
    click_on "Update Empire master il list"

    assert_text "Empire master il list was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master il list" do
    visit empire_master_il_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master il list was successfully destroyed"
  end
end
