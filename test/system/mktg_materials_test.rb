require "application_system_test_case"

class MktgMaterialsTest < ApplicationSystemTestCase
  setup do
    @mktg_material = mktg_materials(:one)
  end

  test "visiting the index" do
    visit mktg_materials_url
    assert_selector "h1", text: "Mktg Materials"
  end

  test "creating a Mktg material" do
    visit mktg_materials_url
    click_on "New Mktg Material"

    fill_in "Campaign", with: @mktg_material.campaign
    fill_in "Co", with: @mktg_material.co
    fill_in "Delivered to", with: @mktg_material.delivered_to
    fill_in "Land date", with: @mktg_material.land_date
    fill_in "Link name", with: @mktg_material.link_name
    fill_in "Name", with: @mktg_material.name
    fill_in "Quantity", with: @mktg_material.quantity
    click_on "Create Mktg material"

    assert_text "Mktg material was successfully created"
    click_on "Back"
  end

  test "updating a Mktg material" do
    visit mktg_materials_url
    click_on "Edit", match: :first

    fill_in "Campaign", with: @mktg_material.campaign
    fill_in "Co", with: @mktg_material.co
    fill_in "Delivered to", with: @mktg_material.delivered_to
    fill_in "Land date", with: @mktg_material.land_date
    fill_in "Link name", with: @mktg_material.link_name
    fill_in "Name", with: @mktg_material.name
    fill_in "Quantity", with: @mktg_material.quantity
    click_on "Update Mktg material"

    assert_text "Mktg material was successfully updated"
    click_on "Back"
  end

  test "destroying a Mktg material" do
    visit mktg_materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mktg material was successfully destroyed"
  end
end
