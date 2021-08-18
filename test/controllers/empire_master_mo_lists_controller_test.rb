require "test_helper"

class EmpireMasterMoListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_mo_list = empire_master_mo_lists(:one)
  end

  test "should get index" do
    get empire_master_mo_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_mo_list_url
    assert_response :success
  end

  test "should create empire_master_mo_list" do
    assert_difference('EmpireMasterMoList.count') do
      post empire_master_mo_lists_url, params: { empire_master_mo_list: { add: @empire_master_mo_list.add, add2: @empire_master_mo_list.add2, city: @empire_master_mo_list.city, co: @empire_master_mo_list.co, email: @empire_master_mo_list.email, exp_date: @empire_master_mo_list.exp_date, exp_date_s: @empire_master_mo_list.exp_date_s, fname: @empire_master_mo_list.fname, iss_date: @empire_master_mo_list.iss_date, iss_date_s: @empire_master_mo_list.iss_date_s, lic: @empire_master_mo_list.lic, lic_state: @empire_master_mo_list.lic_state, lic_status: @empire_master_mo_list.lic_status, lid: @empire_master_mo_list.lid, list: @empire_master_mo_list.list, lname: @empire_master_mo_list.lname, mi: @empire_master_mo_list.mi, phone: @empire_master_mo_list.phone, record_type: @empire_master_mo_list.record_type, st: @empire_master_mo_list.st, suf: @empire_master_mo_list.suf, zip: @empire_master_mo_list.zip } }
    end

    assert_redirected_to empire_master_mo_list_url(EmpireMasterMoList.last)
  end

  test "should show empire_master_mo_list" do
    get empire_master_mo_list_url(@empire_master_mo_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_mo_list_url(@empire_master_mo_list)
    assert_response :success
  end

  test "should update empire_master_mo_list" do
    patch empire_master_mo_list_url(@empire_master_mo_list), params: { empire_master_mo_list: { add: @empire_master_mo_list.add, add2: @empire_master_mo_list.add2, city: @empire_master_mo_list.city, co: @empire_master_mo_list.co, email: @empire_master_mo_list.email, exp_date: @empire_master_mo_list.exp_date, exp_date_s: @empire_master_mo_list.exp_date_s, fname: @empire_master_mo_list.fname, iss_date: @empire_master_mo_list.iss_date, iss_date_s: @empire_master_mo_list.iss_date_s, lic: @empire_master_mo_list.lic, lic_state: @empire_master_mo_list.lic_state, lic_status: @empire_master_mo_list.lic_status, lid: @empire_master_mo_list.lid, list: @empire_master_mo_list.list, lname: @empire_master_mo_list.lname, mi: @empire_master_mo_list.mi, phone: @empire_master_mo_list.phone, record_type: @empire_master_mo_list.record_type, st: @empire_master_mo_list.st, suf: @empire_master_mo_list.suf, zip: @empire_master_mo_list.zip } }
    assert_redirected_to empire_master_mo_list_url(@empire_master_mo_list)
  end

  test "should destroy empire_master_mo_list" do
    assert_difference('EmpireMasterMoList.count', -1) do
      delete empire_master_mo_list_url(@empire_master_mo_list)
    end

    assert_redirected_to empire_master_mo_lists_url
  end
end
