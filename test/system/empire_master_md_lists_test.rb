require "application_system_test_case"

class EmpireMasterMdListsTest < ApplicationSystemTestCase
  setup do
    @empire_master_md_list = empire_master_md_lists(:one)
  end

  test "visiting the index" do
    visit empire_master_md_lists_url
    assert_selector "h1", text: "Empire Master Md Lists"
  end

  test "creating a Empire master md list" do
    visit empire_master_md_lists_url
    click_on "New Empire Master Md List"

    fill_in "Add", with: @empire_master_md_list.add
    fill_in "Add2", with: @empire_master_md_list.add2
    fill_in "City", with: @empire_master_md_list.city
    fill_in "Co", with: @empire_master_md_list.co
    fill_in "Email", with: @empire_master_md_list.email
    fill_in "Exp date", with: @empire_master_md_list.exp_date
    fill_in "Exp date s", with: @empire_master_md_list.exp_date_s
    fill_in "Fname", with: @empire_master_md_list.fname
    fill_in "Iss date", with: @empire_master_md_list.iss_date
    fill_in "Iss date s", with: @empire_master_md_list.iss_date_s
    fill_in "Lic", with: @empire_master_md_list.lic
    fill_in "Lic state", with: @empire_master_md_list.lic_state
    fill_in "Lic status", with: @empire_master_md_list.lic_status
    fill_in "Lid", with: @empire_master_md_list.lid
    fill_in "List", with: @empire_master_md_list.list
    fill_in "Lname", with: @empire_master_md_list.lname
    fill_in "Mi", with: @empire_master_md_list.mi
    fill_in "Phone", with: @empire_master_md_list.phone
    fill_in "Record type", with: @empire_master_md_list.record_type
    fill_in "St", with: @empire_master_md_list.st
    fill_in "Suf", with: @empire_master_md_list.suf
    fill_in "Zip", with: @empire_master_md_list.zip
    click_on "Create Empire master md list"

    assert_text "Empire master md list was successfully created"
    click_on "Back"
  end

  test "updating a Empire master md list" do
    visit empire_master_md_lists_url
    click_on "Edit", match: :first

    fill_in "Add", with: @empire_master_md_list.add
    fill_in "Add2", with: @empire_master_md_list.add2
    fill_in "City", with: @empire_master_md_list.city
    fill_in "Co", with: @empire_master_md_list.co
    fill_in "Email", with: @empire_master_md_list.email
    fill_in "Exp date", with: @empire_master_md_list.exp_date
    fill_in "Exp date s", with: @empire_master_md_list.exp_date_s
    fill_in "Fname", with: @empire_master_md_list.fname
    fill_in "Iss date", with: @empire_master_md_list.iss_date
    fill_in "Iss date s", with: @empire_master_md_list.iss_date_s
    fill_in "Lic", with: @empire_master_md_list.lic
    fill_in "Lic state", with: @empire_master_md_list.lic_state
    fill_in "Lic status", with: @empire_master_md_list.lic_status
    fill_in "Lid", with: @empire_master_md_list.lid
    fill_in "List", with: @empire_master_md_list.list
    fill_in "Lname", with: @empire_master_md_list.lname
    fill_in "Mi", with: @empire_master_md_list.mi
    fill_in "Phone", with: @empire_master_md_list.phone
    fill_in "Record type", with: @empire_master_md_list.record_type
    fill_in "St", with: @empire_master_md_list.st
    fill_in "Suf", with: @empire_master_md_list.suf
    fill_in "Zip", with: @empire_master_md_list.zip
    click_on "Update Empire master md list"

    assert_text "Empire master md list was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire master md list" do
    visit empire_master_md_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire master md list was successfully destroyed"
  end
end
