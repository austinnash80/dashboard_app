require "test_helper"

class EmpireMasterTxListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_tx_list = empire_master_tx_lists(:one)
  end

  test "should get index" do
    get empire_master_tx_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_tx_list_url
    assert_response :success
  end

  test "should create empire_master_tx_list" do
    assert_difference('EmpireMasterTxList.count') do
      post empire_master_tx_lists_url, params: { empire_master_tx_list: { add: @empire_master_tx_list.add, add2: @empire_master_tx_list.add2, city: @empire_master_tx_list.city, email: @empire_master_tx_list.email, exp_date: @empire_master_tx_list.exp_date, exp_date_s: @empire_master_tx_list.exp_date_s, fname: @empire_master_tx_list.fname, iss_date: @empire_master_tx_list.iss_date, iss_date_s: @empire_master_tx_list.iss_date_s, lic: @empire_master_tx_list.lic, lic_state: @empire_master_tx_list.lic_state, lic_status: @empire_master_tx_list.lic_status, lid: @empire_master_tx_list.lid, list: @empire_master_tx_list.list, lname: @empire_master_tx_list.lname, mi: @empire_master_tx_list.mi, phone: @empire_master_tx_list.phone, record_type: @empire_master_tx_list.record_type, st: @empire_master_tx_list.st, zip: @empire_master_tx_list.zip } }
    end

    assert_redirected_to empire_master_tx_list_url(EmpireMasterTxList.last)
  end

  test "should show empire_master_tx_list" do
    get empire_master_tx_list_url(@empire_master_tx_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_tx_list_url(@empire_master_tx_list)
    assert_response :success
  end

  test "should update empire_master_tx_list" do
    patch empire_master_tx_list_url(@empire_master_tx_list), params: { empire_master_tx_list: { add: @empire_master_tx_list.add, add2: @empire_master_tx_list.add2, city: @empire_master_tx_list.city, email: @empire_master_tx_list.email, exp_date: @empire_master_tx_list.exp_date, exp_date_s: @empire_master_tx_list.exp_date_s, fname: @empire_master_tx_list.fname, iss_date: @empire_master_tx_list.iss_date, iss_date_s: @empire_master_tx_list.iss_date_s, lic: @empire_master_tx_list.lic, lic_state: @empire_master_tx_list.lic_state, lic_status: @empire_master_tx_list.lic_status, lid: @empire_master_tx_list.lid, list: @empire_master_tx_list.list, lname: @empire_master_tx_list.lname, mi: @empire_master_tx_list.mi, phone: @empire_master_tx_list.phone, record_type: @empire_master_tx_list.record_type, st: @empire_master_tx_list.st, zip: @empire_master_tx_list.zip } }
    assert_redirected_to empire_master_tx_list_url(@empire_master_tx_list)
  end

  test "should destroy empire_master_tx_list" do
    assert_difference('EmpireMasterTxList.count', -1) do
      delete empire_master_tx_list_url(@empire_master_tx_list)
    end

    assert_redirected_to empire_master_tx_lists_url
  end
end
