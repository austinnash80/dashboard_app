require "test_helper"

class EmpireMasterNjListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_nj_list = empire_master_nj_lists(:one)
  end

  test "should get index" do
    get empire_master_nj_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_nj_list_url
    assert_response :success
  end

  test "should create empire_master_nj_list" do
    assert_difference('EmpireMasterNjList.count') do
      post empire_master_nj_lists_url, params: { empire_master_nj_list: { add: @empire_master_nj_list.add, add2: @empire_master_nj_list.add2, city: @empire_master_nj_list.city, email: @empire_master_nj_list.email, exp_date: @empire_master_nj_list.exp_date, exp_date_s: @empire_master_nj_list.exp_date_s, fname: @empire_master_nj_list.fname, iss_date: @empire_master_nj_list.iss_date, iss_date_s: @empire_master_nj_list.iss_date_s, lic: @empire_master_nj_list.lic, lic_state: @empire_master_nj_list.lic_state, lic_status: @empire_master_nj_list.lic_status, lid: @empire_master_nj_list.lid, list: @empire_master_nj_list.list, lname: @empire_master_nj_list.lname, mi: @empire_master_nj_list.mi, phone: @empire_master_nj_list.phone, record_type: @empire_master_nj_list.record_type, st: @empire_master_nj_list.st, zip: @empire_master_nj_list.zip } }
    end

    assert_redirected_to empire_master_nj_list_url(EmpireMasterNjList.last)
  end

  test "should show empire_master_nj_list" do
    get empire_master_nj_list_url(@empire_master_nj_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_nj_list_url(@empire_master_nj_list)
    assert_response :success
  end

  test "should update empire_master_nj_list" do
    patch empire_master_nj_list_url(@empire_master_nj_list), params: { empire_master_nj_list: { add: @empire_master_nj_list.add, add2: @empire_master_nj_list.add2, city: @empire_master_nj_list.city, email: @empire_master_nj_list.email, exp_date: @empire_master_nj_list.exp_date, exp_date_s: @empire_master_nj_list.exp_date_s, fname: @empire_master_nj_list.fname, iss_date: @empire_master_nj_list.iss_date, iss_date_s: @empire_master_nj_list.iss_date_s, lic: @empire_master_nj_list.lic, lic_state: @empire_master_nj_list.lic_state, lic_status: @empire_master_nj_list.lic_status, lid: @empire_master_nj_list.lid, list: @empire_master_nj_list.list, lname: @empire_master_nj_list.lname, mi: @empire_master_nj_list.mi, phone: @empire_master_nj_list.phone, record_type: @empire_master_nj_list.record_type, st: @empire_master_nj_list.st, zip: @empire_master_nj_list.zip } }
    assert_redirected_to empire_master_nj_list_url(@empire_master_nj_list)
  end

  test "should destroy empire_master_nj_list" do
    assert_difference('EmpireMasterNjList.count', -1) do
      delete empire_master_nj_list_url(@empire_master_nj_list)
    end

    assert_redirected_to empire_master_nj_lists_url
  end
end
