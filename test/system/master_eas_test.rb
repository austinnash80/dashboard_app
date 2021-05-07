require "application_system_test_case"

class MasterEasTest < ApplicationSystemTestCase
  setup do
    @master_ea = master_eas(:one)
  end

  test "visiting the index" do
    visit master_eas_url
    assert_selector "h1", text: "Master Eas"
  end

  test "creating a Master ea" do
    visit master_eas_url
    click_on "New Master Ea"

    fill_in "Add", with: @master_ea.add
    fill_in "Add2", with: @master_ea.add2
    fill_in "City", with: @master_ea.city
    fill_in "Co", with: @master_ea.co
    fill_in "Fname", with: @master_ea.fname
    fill_in "Lic", with: @master_ea.lic
    fill_in "Lid", with: @master_ea.lid
    fill_in "List", with: @master_ea.list
    fill_in "Lname", with: @master_ea.lname
    fill_in "Mi", with: @master_ea.mi
    fill_in "St", with: @master_ea.st
    fill_in "Suf", with: @master_ea.suf
    fill_in "Zip", with: @master_ea.zip
    click_on "Create Master ea"

    assert_text "Master ea was successfully created"
    click_on "Back"
  end

  test "updating a Master ea" do
    visit master_eas_url
    click_on "Edit", match: :first

    fill_in "Add", with: @master_ea.add
    fill_in "Add2", with: @master_ea.add2
    fill_in "City", with: @master_ea.city
    fill_in "Co", with: @master_ea.co
    fill_in "Fname", with: @master_ea.fname
    fill_in "Lic", with: @master_ea.lic
    fill_in "Lid", with: @master_ea.lid
    fill_in "List", with: @master_ea.list
    fill_in "Lname", with: @master_ea.lname
    fill_in "Mi", with: @master_ea.mi
    fill_in "St", with: @master_ea.st
    fill_in "Suf", with: @master_ea.suf
    fill_in "Zip", with: @master_ea.zip
    click_on "Update Master ea"

    assert_text "Master ea was successfully updated"
    click_on "Back"
  end

  test "destroying a Master ea" do
    visit master_eas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master ea was successfully destroyed"
  end
end
