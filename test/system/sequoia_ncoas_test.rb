require "application_system_test_case"

class SequoiaNcoasTest < ApplicationSystemTestCase
  setup do
    @sequoia_ncoa = sequoia_ncoas(:one)
  end

  test "visiting the index" do
    visit sequoia_ncoas_url
    assert_selector "h1", text: "Sequoia Ncoas"
  end

  test "creating a Sequoia ncoa" do
    visit sequoia_ncoas_url
    click_on "New Sequoia Ncoa"

    check "Bad" if @sequoia_ncoa.bad
    fill_in "City", with: @sequoia_ncoa.city
    check "Good" if @sequoia_ncoa.good
    fill_in "Ncoa list", with: @sequoia_ncoa.ncoa_list
    fill_in "State", with: @sequoia_ncoa.state
    fill_in "Stree 1", with: @sequoia_ncoa.stree_1
    fill_in "Street 2", with: @sequoia_ncoa.street_2
    fill_in "Uid", with: @sequoia_ncoa.uid
    fill_in "Zip", with: @sequoia_ncoa.zip
    click_on "Create Sequoia ncoa"

    assert_text "Sequoia ncoa was successfully created"
    click_on "Back"
  end

  test "updating a Sequoia ncoa" do
    visit sequoia_ncoas_url
    click_on "Edit", match: :first

    check "Bad" if @sequoia_ncoa.bad
    fill_in "City", with: @sequoia_ncoa.city
    check "Good" if @sequoia_ncoa.good
    fill_in "Ncoa list", with: @sequoia_ncoa.ncoa_list
    fill_in "State", with: @sequoia_ncoa.state
    fill_in "Stree 1", with: @sequoia_ncoa.stree_1
    fill_in "Street 2", with: @sequoia_ncoa.street_2
    fill_in "Uid", with: @sequoia_ncoa.uid
    fill_in "Zip", with: @sequoia_ncoa.zip
    click_on "Update Sequoia ncoa"

    assert_text "Sequoia ncoa was successfully updated"
    click_on "Back"
  end

  test "destroying a Sequoia ncoa" do
    visit sequoia_ncoas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sequoia ncoa was successfully destroyed"
  end
end
