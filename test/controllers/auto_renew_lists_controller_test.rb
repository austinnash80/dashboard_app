require "test_helper"

class AutoRenewListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auto_renew_list = auto_renew_lists(:one)
  end

  test "should get index" do
    get auto_renew_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_auto_renew_list_url
    assert_response :success
  end

  test "should create auto_renew_list" do
    assert_difference('AutoRenewList.count') do
      post auto_renew_lists_url, params: { auto_renew_list: { uid: @auto_renew_list.uid } }
    end

    assert_redirected_to auto_renew_list_url(AutoRenewList.last)
  end

  test "should show auto_renew_list" do
    get auto_renew_list_url(@auto_renew_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_auto_renew_list_url(@auto_renew_list)
    assert_response :success
  end

  test "should update auto_renew_list" do
    patch auto_renew_list_url(@auto_renew_list), params: { auto_renew_list: { uid: @auto_renew_list.uid } }
    assert_redirected_to auto_renew_list_url(@auto_renew_list)
  end

  test "should destroy auto_renew_list" do
    assert_difference('AutoRenewList.count', -1) do
      delete auto_renew_list_url(@auto_renew_list)
    end

    assert_redirected_to auto_renew_lists_url
  end
end
