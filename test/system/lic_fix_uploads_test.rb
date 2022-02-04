require "application_system_test_case"

class LicFixUploadsTest < ApplicationSystemTestCase
  setup do
    @lic_fix_upload = lic_fix_uploads(:one)
  end

  test "visiting the index" do
    visit lic_fix_uploads_url
    assert_selector "h1", text: "Lic Fix Uploads"
  end

  test "creating a Lic fix upload" do
    visit lic_fix_uploads_url
    click_on "New Lic Fix Upload"

    fill_in "Lic", with: @lic_fix_upload.lic
    fill_in "Uid", with: @lic_fix_upload.uid
    click_on "Create Lic fix upload"

    assert_text "Lic fix upload was successfully created"
    click_on "Back"
  end

  test "updating a Lic fix upload" do
    visit lic_fix_uploads_url
    click_on "Edit", match: :first

    fill_in "Lic", with: @lic_fix_upload.lic
    fill_in "Uid", with: @lic_fix_upload.uid
    click_on "Update Lic fix upload"

    assert_text "Lic fix upload was successfully updated"
    click_on "Back"
  end

  test "destroying a Lic fix upload" do
    visit lic_fix_uploads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lic fix upload was successfully destroyed"
  end
end
