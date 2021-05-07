require "test_helper"

class MasterCpasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_cpa = master_cpas(:one)
  end

  test "should get index" do
    get master_cpas_url
    assert_response :success
  end

  test "should get new" do
    get new_master_cpa_url
    assert_response :success
  end

  test "should create master_cpa" do
    assert_difference('MasterCpa.count') do
      post master_cpas_url, params: { master_cpa: { add: @master_cpa.add, add2: @master_cpa.add2, city: @master_cpa.city, co: @master_cpa.co, fname: @master_cpa.fname, lic: @master_cpa.lic, lic_st: @master_cpa.lic_st, lid: @master_cpa.lid, list: @master_cpa.list, lname: @master_cpa.lname, mi: @master_cpa.mi, st: @master_cpa.st, suf: @master_cpa.suf, zip: @master_cpa.zip } }
    end

    assert_redirected_to master_cpa_url(MasterCpa.last)
  end

  test "should show master_cpa" do
    get master_cpa_url(@master_cpa)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_cpa_url(@master_cpa)
    assert_response :success
  end

  test "should update master_cpa" do
    patch master_cpa_url(@master_cpa), params: { master_cpa: { add: @master_cpa.add, add2: @master_cpa.add2, city: @master_cpa.city, co: @master_cpa.co, fname: @master_cpa.fname, lic: @master_cpa.lic, lic_st: @master_cpa.lic_st, lid: @master_cpa.lid, list: @master_cpa.list, lname: @master_cpa.lname, mi: @master_cpa.mi, st: @master_cpa.st, suf: @master_cpa.suf, zip: @master_cpa.zip } }
    assert_redirected_to master_cpa_url(@master_cpa)
  end

  test "should destroy master_cpa" do
    assert_difference('MasterCpa.count', -1) do
      delete master_cpa_url(@master_cpa)
    end

    assert_redirected_to master_cpas_url
  end
end
