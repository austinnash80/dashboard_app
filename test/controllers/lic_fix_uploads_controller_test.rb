require "test_helper"

class LicFixUploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lic_fix_upload = lic_fix_uploads(:one)
  end

  test "should get index" do
    get lic_fix_uploads_url
    assert_response :success
  end

  test "should get new" do
    get new_lic_fix_upload_url
    assert_response :success
  end

  test "should create lic_fix_upload" do
    assert_difference('LicFixUpload.count') do
      post lic_fix_uploads_url, params: { lic_fix_upload: { lic: @lic_fix_upload.lic, uid: @lic_fix_upload.uid } }
    end

    assert_redirected_to lic_fix_upload_url(LicFixUpload.last)
  end

  test "should show lic_fix_upload" do
    get lic_fix_upload_url(@lic_fix_upload)
    assert_response :success
  end

  test "should get edit" do
    get edit_lic_fix_upload_url(@lic_fix_upload)
    assert_response :success
  end

  test "should update lic_fix_upload" do
    patch lic_fix_upload_url(@lic_fix_upload), params: { lic_fix_upload: { lic: @lic_fix_upload.lic, uid: @lic_fix_upload.uid } }
    assert_redirected_to lic_fix_upload_url(@lic_fix_upload)
  end

  test "should destroy lic_fix_upload" do
    assert_difference('LicFixUpload.count', -1) do
      delete lic_fix_upload_url(@lic_fix_upload)
    end

    assert_redirected_to lic_fix_uploads_url
  end
end
