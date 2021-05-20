require "test_helper"

class MktgExportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mktg_export = mktg_exports(:one)
  end

  test "should get index" do
    get mktg_exports_url
    assert_response :success
  end

  test "should get new" do
    get new_mktg_export_url
    assert_response :success
  end

  test "should create mktg_export" do
    assert_difference('MktgExport.count') do
      post mktg_exports_url, params: { mktg_export: { campaign: @mktg_export.campaign, city: @mktg_export.city, des: @mktg_export.des, exp: @mktg_export.exp, fname: @mktg_export.fname, lname: @mktg_export.lname, state: @mktg_export.state, street_1: @mktg_export.street_1, street_2: @mktg_export.street_2, text_1: @mktg_export.text_1, text_10: @mktg_export.text_10, text_2: @mktg_export.text_2, text_3: @mktg_export.text_3, text_4: @mktg_export.text_4, text_5: @mktg_export.text_5, text_6: @mktg_export.text_6, text_7: @mktg_export.text_7, text_8: @mktg_export.text_8, text_9: @mktg_export.text_9, uid: @mktg_export.uid, zip: @mktg_export.zip } }
    end

    assert_redirected_to mktg_export_url(MktgExport.last)
  end

  test "should show mktg_export" do
    get mktg_export_url(@mktg_export)
    assert_response :success
  end

  test "should get edit" do
    get edit_mktg_export_url(@mktg_export)
    assert_response :success
  end

  test "should update mktg_export" do
    patch mktg_export_url(@mktg_export), params: { mktg_export: { campaign: @mktg_export.campaign, city: @mktg_export.city, des: @mktg_export.des, exp: @mktg_export.exp, fname: @mktg_export.fname, lname: @mktg_export.lname, state: @mktg_export.state, street_1: @mktg_export.street_1, street_2: @mktg_export.street_2, text_1: @mktg_export.text_1, text_10: @mktg_export.text_10, text_2: @mktg_export.text_2, text_3: @mktg_export.text_3, text_4: @mktg_export.text_4, text_5: @mktg_export.text_5, text_6: @mktg_export.text_6, text_7: @mktg_export.text_7, text_8: @mktg_export.text_8, text_9: @mktg_export.text_9, uid: @mktg_export.uid, zip: @mktg_export.zip } }
    assert_redirected_to mktg_export_url(@mktg_export)
  end

  test "should destroy mktg_export" do
    assert_difference('MktgExport.count', -1) do
      delete mktg_export_url(@mktg_export)
    end

    assert_redirected_to mktg_exports_url
  end
end
