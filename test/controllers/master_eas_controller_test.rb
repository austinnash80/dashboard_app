require "test_helper"

class MasterEasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_ea = master_eas(:one)
  end

  test "should get index" do
    get master_eas_url
    assert_response :success
  end

  test "should get new" do
    get new_master_ea_url
    assert_response :success
  end

  test "should create master_ea" do
    assert_difference('MasterEa.count') do
      post master_eas_url, params: { master_ea: { add: @master_ea.add, add2: @master_ea.add2, city: @master_ea.city, co: @master_ea.co, fname: @master_ea.fname, lic: @master_ea.lic, lid: @master_ea.lid, list: @master_ea.list, lname: @master_ea.lname, mi: @master_ea.mi, st: @master_ea.st, suf: @master_ea.suf, zip: @master_ea.zip } }
    end

    assert_redirected_to master_ea_url(MasterEa.last)
  end

  test "should show master_ea" do
    get master_ea_url(@master_ea)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_ea_url(@master_ea)
    assert_response :success
  end

  test "should update master_ea" do
    patch master_ea_url(@master_ea), params: { master_ea: { add: @master_ea.add, add2: @master_ea.add2, city: @master_ea.city, co: @master_ea.co, fname: @master_ea.fname, lic: @master_ea.lic, lid: @master_ea.lid, list: @master_ea.list, lname: @master_ea.lname, mi: @master_ea.mi, st: @master_ea.st, suf: @master_ea.suf, zip: @master_ea.zip } }
    assert_redirected_to master_ea_url(@master_ea)
  end

  test "should destroy master_ea" do
    assert_difference('MasterEa.count', -1) do
      delete master_ea_url(@master_ea)
    end

    assert_redirected_to master_eas_url
  end
end
