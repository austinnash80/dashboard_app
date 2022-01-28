require "test_helper"

class EmpireMasterMdListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_md_list = empire_master_md_lists(:one)
  end

  test "should get index" do
    get empire_master_md_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_md_list_url
    assert_response :success
  end

  test "should create empire_master_md_list" do
    assert_difference('EmpireMasterMdList.count') do
      post empire_master_md_lists_url, params: { empire_master_md_list: { add: @empire_master_md_list.add, add2: @empire_master_md_list.add2, city: @empire_master_md_list.city, co: @empire_master_md_list.co, email: @empire_master_md_list.email, exp_date: @empire_master_md_list.exp_date, exp_date_s: @empire_master_md_list.exp_date_s, fname: @empire_master_md_list.fname, iss_date: @empire_master_md_list.iss_date, iss_date_s: @empire_master_md_list.iss_date_s, lic: @empire_master_md_list.lic, lic_state: @empire_master_md_list.lic_state, lic_status: @empire_master_md_list.lic_status, lid: @empire_master_md_list.lid, list: @empire_master_md_list.list, lname: @empire_master_md_list.lname, mi: @empire_master_md_list.mi, phone: @empire_master_md_list.phone, record_type: @empire_master_md_list.record_type, st: @empire_master_md_list.st, suf: @empire_master_md_list.suf, zip: @empire_master_md_list.zip } }
    end

    assert_redirected_to empire_master_md_list_url(EmpireMasterMdList.last)
  end

  test "should show empire_master_md_list" do
    get empire_master_md_list_url(@empire_master_md_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_md_list_url(@empire_master_md_list)
    assert_response :success
  end

  test "should update empire_master_md_list" do
    patch empire_master_md_list_url(@empire_master_md_list), params: { empire_master_md_list: { add: @empire_master_md_list.add, add2: @empire_master_md_list.add2, city: @empire_master_md_list.city, co: @empire_master_md_list.co, email: @empire_master_md_list.email, exp_date: @empire_master_md_list.exp_date, exp_date_s: @empire_master_md_list.exp_date_s, fname: @empire_master_md_list.fname, iss_date: @empire_master_md_list.iss_date, iss_date_s: @empire_master_md_list.iss_date_s, lic: @empire_master_md_list.lic, lic_state: @empire_master_md_list.lic_state, lic_status: @empire_master_md_list.lic_status, lid: @empire_master_md_list.lid, list: @empire_master_md_list.list, lname: @empire_master_md_list.lname, mi: @empire_master_md_list.mi, phone: @empire_master_md_list.phone, record_type: @empire_master_md_list.record_type, st: @empire_master_md_list.st, suf: @empire_master_md_list.suf, zip: @empire_master_md_list.zip } }
    assert_redirected_to empire_master_md_list_url(@empire_master_md_list)
  end

  test "should destroy empire_master_md_list" do
    assert_difference('EmpireMasterMdList.count', -1) do
      delete empire_master_md_list_url(@empire_master_md_list)
    end

    assert_redirected_to empire_master_md_lists_url
  end
end
