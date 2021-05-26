require "test_helper"

class EmpireMasterDoubleAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_double_account = empire_master_double_accounts(:one)
  end

  test "should get index" do
    get empire_master_double_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_double_account_url
    assert_response :success
  end

  test "should create empire_master_double_account" do
    assert_difference('EmpireMasterDoubleAccount.count') do
      post empire_master_double_accounts_url, params: { empire_master_double_account: { lic_st: @empire_master_double_account.lic_st, list: @empire_master_double_account.list, lname: @empire_master_double_account.lname, search_date: @empire_master_double_account.search_date, uid: @empire_master_double_account.uid } }
    end

    assert_redirected_to empire_master_double_account_url(EmpireMasterDoubleAccount.last)
  end

  test "should show empire_master_double_account" do
    get empire_master_double_account_url(@empire_master_double_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_double_account_url(@empire_master_double_account)
    assert_response :success
  end

  test "should update empire_master_double_account" do
    patch empire_master_double_account_url(@empire_master_double_account), params: { empire_master_double_account: { lic_st: @empire_master_double_account.lic_st, list: @empire_master_double_account.list, lname: @empire_master_double_account.lname, search_date: @empire_master_double_account.search_date, uid: @empire_master_double_account.uid } }
    assert_redirected_to empire_master_double_account_url(@empire_master_double_account)
  end

  test "should destroy empire_master_double_account" do
    assert_difference('EmpireMasterDoubleAccount.count', -1) do
      delete empire_master_double_account_url(@empire_master_double_account)
    end

    assert_redirected_to empire_master_double_accounts_url
  end
end
