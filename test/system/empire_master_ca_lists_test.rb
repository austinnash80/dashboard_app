require "application_system_test_case"

class EmpireMasterCaListsTest < ApplicationSystemTestCase
  setup do
    @empire_master_ca_list = empire_master_ca_lists(:one)
  end

  test "visiting the index" do
    visit empire_master_ca_lists_url
    assert_selector "h1", text: "Empire Master Ca Lists"
  end

  test "creating a Empire master ca list" do
    visit empire_master_ca_lists_url
    click_on "New Empire Master Ca List"

    fill_in "Add", with: @empire_master_ca_list.add
    fill_in "Add2", with: @empire_master_ca_list.add2
    fill_in "City", with: @empire_master_ca_list.city
    fill_in "Co", with: @empire_master_ca_list.co
    fill_in "Email", with: @empire_master_ca_list.email
    fill_in "Exp date", with: @empire_master_ca_list.exp_date
    fill_in "Exp date s", with: @empire_master_ca_list.exp_date_s
    fill_in "Fname", with: @empire_master_ca_list.fname
    fill_in "Iss date", with: @empire_master_ca_list.iss_date
    fill_in "Iss date s", with: @empire_master_ca_list.iss_date_s
    fill_in "Lic", with: @empire_master_ca_list.lic
    fill_in "Lic status", with: @empire_master_ca_list.lic_status
    fill_in "Lid", with: @empire_master_ca_list.lid
    fill_in "List", with: @empire_master_ca_list.list
    fill_in "Lname", with: @empire_master_ca_list.lname
    fill_in "Mi", with: @empire_master_ca_list.mi
    fill_in "Phone", with: @empire_master_ca_list.phone
    fill_in "Record type", with: @empire_master_ca_list.record_type
    fill_in "St", with: @empire_master_ca_list.st
    fill_in "Suf", with: @empire_master_ca_list.suf
    fill_in "Zip", with: @empire_master_ca_list.zip
    click_on "Create Empire master ca list"

    assert_text "Empire master ca list was successfully created"
    click_on "Back"
  end

  test "updating a Empire master ca list" do
    visit empire_master_ca_lists_url
    click_on "Edit", match: :first

    fill_in "Add", with: @empire_master_ca_list.add
    fill_in "Add2", with: @empire_master_ca_list.add2
    fill_in "City", with: @empire_master_ca_list.city
    fill_in "Co", with: @empire_master_ca_list.co
    fill_in "Email", with: @empire_master_ca_list.email
    fill_in "Exp date", with: @empire_master_ca_list.exp_date
    fill_in "Exp date s", with: @empire_master_ca_list.exp_date_s
    fill_in "Fname", with: @empire_master_ca_list.fname
    fill_in "Iss date", with: @empire_master_ca_list.iss_date
    fill_in "Iss date s", with: @empire_master_ca_list.iss_date_s
    fill_in "Lic", with: @empire_master_ca_list.lic
    fill_in "Lic status", with: @empire_master_ca_list.lic_status
    fill_in "Lid", with: @empire_master_ca_list.lid
    fill_in "List", with: @empire_master_ca_list.list
    fill_in "Lname", with: @empire_master_ca_list.lname
    fill_in "Mi", with: @empire_master_ca_list.mi
    fill_in "Phone", with: @empire_master_ca_list.phone
    fill_in "Record type", with: @empire_master_ca_list.record_type
    fill_in "St", with: @empire_master_ca_list.st
    fill_in "Suf", with: @empire_master_ca_list.suf
    fill_in "Zip", with: @empire_master_ca_list.zip
    click_on "Update Empire master ca list"

    assert_text "Empire master ca list was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master ca list" do
    visit empire_master_ca_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master ca list was successfully destroyed"
  end
end
