require "test_helper"

class MasterEaDoubleAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_ea_double_account = master_ea_double_accounts(:one)
  end

  test "should get index" do
    get master_ea_double_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_master_ea_double_account_url
    assert_response :success
  end

  test "should create master_ea_double_account" do
    assert_difference('MasterEaDoubleAccount.count') do
      post master_ea_double_accounts_url, params: { master_ea_double_account: { lid: @master_ea_double_account.lid, list: @master_ea_double_account.list, lname: @master_ea_double_account.lname, search_date: @master_ea_double_account.search_date, uid: @master_ea_double_account.uid } }
    end

    assert_redirected_to master_ea_double_account_url(MasterEaDoubleAccount.last)
  end

  test "should show master_ea_double_account" do
    get master_ea_double_account_url(@master_ea_double_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_ea_double_account_url(@master_ea_double_account)
    assert_response :success
  end

  test "should update master_ea_double_account" do
    patch master_ea_double_account_url(@master_ea_double_account), params: { master_ea_double_account: { lid: @master_ea_double_account.lid, list: @master_ea_double_account.list, lname: @master_ea_double_account.lname, search_date: @master_ea_double_account.search_date, uid: @master_ea_double_account.uid } }
    assert_redirected_to master_ea_double_account_url(@master_ea_double_account)
  end

  test "should destroy master_ea_double_account" do
    assert_difference('MasterEaDoubleAccount.count', -1) do
      delete master_ea_double_account_url(@master_ea_double_account)
    end

    assert_redirected_to master_ea_double_accounts_url
  end
end
