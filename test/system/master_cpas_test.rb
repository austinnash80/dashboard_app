require "application_system_test_case"

class MasterCpasTest < ApplicationSystemTestCase
  setup do
    @master_cpa = master_cpas(:one)
  end

  test "visiting the index" do
    visit master_cpas_url
    assert_selector "h1", text: "Master Cpas"
  end

  test "creating a Master cpa" do
    visit master_cpas_url
    click_on "New Master Cpa"

    fill_in "Add", with: @master_cpa.add
    fill_in "Add2", with: @master_cpa.add2
    fill_in "City", with: @master_cpa.city
    fill_in "Co", with: @master_cpa.co
    fill_in "Fname", with: @master_cpa.fname
    fill_in "Lic", with: @master_cpa.lic
    fill_in "Lic st", with: @master_cpa.lic_st
    fill_in "Lid", with: @master_cpa.lid
    fill_in "List", with: @master_cpa.list
    fill_in "Lname", with: @master_cpa.lname
    fill_in "Mi", with: @master_cpa.mi
    fill_in "St", with: @master_cpa.st
    fill_in "Suf", with: @master_cpa.suf
    fill_in "Zip", with: @master_cpa.zip
    click_on "Create Master cpa"

    assert_text "Master cpa was successfully created"
    click_on "Back"
  end

  test "updating a Master cpa" do
    visit master_cpas_url
    click_on "Edit", match: :first

    fill_in "Add", with: @master_cpa.add
    fill_in "Add2", with: @master_cpa.add2
    fill_in "City", with: @master_cpa.city
    fill_in "Co", with: @master_cpa.co
    fill_in "Fname", with: @master_cpa.fname
    fill_in "Lic", with: @master_cpa.lic
    fill_in "Lic st", with: @master_cpa.lic_st
    fill_in "Lid", with: @master_cpa.lid
    fill_in "List", with: @master_cpa.list
    fill_in "Lname", with: @master_cpa.lname
    fill_in "Mi", with: @master_cpa.mi
    fill_in "St", with: @master_cpa.st
    fill_in "Suf", with: @master_cpa.suf
    fill_in "Zip", with: @master_cpa.zip
    click_on "Update Master cpa"

    assert_text "Master cpa was successfully updated"
    click_on "Back"
  end

  test "destroying a Master cpa" do
    visit master_cpas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master cpa was successfully destroyed"
  end
end
