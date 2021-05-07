require "test_helper"

class MasterCpaDoubleAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_cpa_double_account = master_cpa_double_accounts(:one)
  end

  test "should get index" do
    get master_cpa_double_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_master_cpa_double_account_url
    assert_response :success
  end

  test "should create master_cpa_double_account" do
    assert_difference('MasterCpaDoubleAccount.count') do
      post master_cpa_double_accounts_url, params: { master_cpa_double_account: { lid: @master_cpa_double_account.lid, list: @master_cpa_double_account.list, lname: @master_cpa_double_account.lname, search_date: @master_cpa_double_account.search_date, uid: @master_cpa_double_account.uid } }
    end

    assert_redirected_to master_cpa_double_account_url(MasterCpaDoubleAccount.last)
  end

  test "should show master_cpa_double_account" do
    get master_cpa_double_account_url(@master_cpa_double_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_cpa_double_account_url(@master_cpa_double_account)
    assert_response :success
  end

  test "should update master_cpa_double_account" do
    patch master_cpa_double_account_url(@master_cpa_double_account), params: { master_cpa_double_account: { lid: @master_cpa_double_account.lid, list: @master_cpa_double_account.list, lname: @master_cpa_double_account.lname, search_date: @master_cpa_double_account.search_date, uid: @master_cpa_double_account.uid } }
    assert_redirected_to master_cpa_double_account_url(@master_cpa_double_account)
  end

  test "should destroy master_cpa_double_account" do
    assert_difference('MasterCpaDoubleAccount.count', -1) do
      delete master_cpa_double_account_url(@master_cpa_double_account)
    end

    assert_redirected_to master_cpa_double_accounts_url
  end
end
