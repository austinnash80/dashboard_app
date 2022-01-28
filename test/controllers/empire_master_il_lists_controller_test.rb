require "test_helper"

class EmpireMasterIlListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_il_list = empire_master_il_lists(:one)
  end

  test "should get index" do
    get empire_master_il_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_il_list_url
    assert_response :success
  end

  test "should create empire_master_il_list" do
    assert_difference('EmpireMasterIlList.count') do
      post empire_master_il_lists_url, params: { empire_master_il_list: { add: @empire_master_il_list.add, adds: @empire_master_il_list.adds, city: @empire_master_il_list.city, co: @empire_master_il_list.co, email: @empire_master_il_list.email, exp_date: @empire_master_il_list.exp_date, exp_date_s: @empire_master_il_list.exp_date_s, fname: @empire_master_il_list.fname, iss_date: @empire_master_il_list.iss_date, iss_date_s: @empire_master_il_list.iss_date_s, lic: @empire_master_il_list.lic, lic_state: @empire_master_il_list.lic_state, lic_status: @empire_master_il_list.lic_status, lid: @empire_master_il_list.lid, list: @empire_master_il_list.list, lname: @empire_master_il_list.lname, mi: @empire_master_il_list.mi, phone: @empire_master_il_list.phone, record_type: @empire_master_il_list.record_type, st: @empire_master_il_list.st, suf: @empire_master_il_list.suf, zip: @empire_master_il_list.zip } }
    end

    assert_redirected_to empire_master_il_list_url(EmpireMasterIlList.last)
  end

  test "should show empire_master_il_list" do
    get empire_master_il_list_url(@empire_master_il_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_il_list_url(@empire_master_il_list)
    assert_response :success
  end

  test "should update empire_master_il_list" do
    patch empire_master_il_list_url(@empire_master_il_list), params: { empire_master_il_list: { add: @empire_master_il_list.add, adds: @empire_master_il_list.adds, city: @empire_master_il_list.city, co: @empire_master_il_list.co, email: @empire_master_il_list.email, exp_date: @empire_master_il_list.exp_date, exp_date_s: @empire_master_il_list.exp_date_s, fname: @empire_master_il_list.fname, iss_date: @empire_master_il_list.iss_date, iss_date_s: @empire_master_il_list.iss_date_s, lic: @empire_master_il_list.lic, lic_state: @empire_master_il_list.lic_state, lic_status: @empire_master_il_list.lic_status, lid: @empire_master_il_list.lid, list: @empire_master_il_list.list, lname: @empire_master_il_list.lname, mi: @empire_master_il_list.mi, phone: @empire_master_il_list.phone, record_type: @empire_master_il_list.record_type, st: @empire_master_il_list.st, suf: @empire_master_il_list.suf, zip: @empire_master_il_list.zip } }
    assert_redirected_to empire_master_il_list_url(@empire_master_il_list)
  end

  test "should destroy empire_master_il_list" do
    assert_difference('EmpireMasterIlList.count', -1) do
      delete empire_master_il_list_url(@empire_master_il_list)
    end

    assert_redirected_to empire_master_il_lists_url
  end
end
