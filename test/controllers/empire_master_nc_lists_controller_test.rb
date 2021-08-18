require "test_helper"

class EmpireMasterNcListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_nc_list = empire_master_nc_lists(:one)
  end

  test "should get index" do
    get empire_master_nc_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_nc_list_url
    assert_response :success
  end

  test "should create empire_master_nc_list" do
    assert_difference('EmpireMasterNcList.count') do
      post empire_master_nc_lists_url, params: { empire_master_nc_list: { add: @empire_master_nc_list.add, add2: @empire_master_nc_list.add2, city: @empire_master_nc_list.city, email: @empire_master_nc_list.email, exp_date: @empire_master_nc_list.exp_date, exp_date_s: @empire_master_nc_list.exp_date_s, fname: @empire_master_nc_list.fname, iss_date: @empire_master_nc_list.iss_date, iss_date_s: @empire_master_nc_list.iss_date_s, lic: @empire_master_nc_list.lic, lic_state: @empire_master_nc_list.lic_state, lic_status: @empire_master_nc_list.lic_status, lid: @empire_master_nc_list.lid, list: @empire_master_nc_list.list, lname: @empire_master_nc_list.lname, mi: @empire_master_nc_list.mi, phone: @empire_master_nc_list.phone, record_type: @empire_master_nc_list.record_type, st: @empire_master_nc_list.st, zip: @empire_master_nc_list.zip } }
    end

    assert_redirected_to empire_master_nc_list_url(EmpireMasterNcList.last)
  end

  test "should show empire_master_nc_list" do
    get empire_master_nc_list_url(@empire_master_nc_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_nc_list_url(@empire_master_nc_list)
    assert_response :success
  end

  test "should update empire_master_nc_list" do
    patch empire_master_nc_list_url(@empire_master_nc_list), params: { empire_master_nc_list: { add: @empire_master_nc_list.add, add2: @empire_master_nc_list.add2, city: @empire_master_nc_list.city, email: @empire_master_nc_list.email, exp_date: @empire_master_nc_list.exp_date, exp_date_s: @empire_master_nc_list.exp_date_s, fname: @empire_master_nc_list.fname, iss_date: @empire_master_nc_list.iss_date, iss_date_s: @empire_master_nc_list.iss_date_s, lic: @empire_master_nc_list.lic, lic_state: @empire_master_nc_list.lic_state, lic_status: @empire_master_nc_list.lic_status, lid: @empire_master_nc_list.lid, list: @empire_master_nc_list.list, lname: @empire_master_nc_list.lname, mi: @empire_master_nc_list.mi, phone: @empire_master_nc_list.phone, record_type: @empire_master_nc_list.record_type, st: @empire_master_nc_list.st, zip: @empire_master_nc_list.zip } }
    assert_redirected_to empire_master_nc_list_url(@empire_master_nc_list)
  end

  test "should destroy empire_master_nc_list" do
    assert_difference('EmpireMasterNcList.count', -1) do
      delete empire_master_nc_list_url(@empire_master_nc_list)
    end

    assert_redirected_to empire_master_nc_lists_url
  end
end
