require "test_helper"

class MasterCpaNoMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_cpa_no_match = master_cpa_no_matches(:one)
  end

  test "should get index" do
    get master_cpa_no_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_master_cpa_no_match_url
    assert_response :success
  end

  test "should create master_cpa_no_match" do
    assert_difference('MasterCpaNoMatch.count') do
      post master_cpa_no_matches_url, params: { master_cpa_no_match: { list: @master_cpa_no_match.list, lname: @master_cpa_no_match.lname, search_date: @master_cpa_no_match.search_date, uid: @master_cpa_no_match.uid } }
    end

    assert_redirected_to master_cpa_no_match_url(MasterCpaNoMatch.last)
  end

  test "should show master_cpa_no_match" do
    get master_cpa_no_match_url(@master_cpa_no_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_cpa_no_match_url(@master_cpa_no_match)
    assert_response :success
  end

  test "should update master_cpa_no_match" do
    patch master_cpa_no_match_url(@master_cpa_no_match), params: { master_cpa_no_match: { list: @master_cpa_no_match.list, lname: @master_cpa_no_match.lname, search_date: @master_cpa_no_match.search_date, uid: @master_cpa_no_match.uid } }
    assert_redirected_to master_cpa_no_match_url(@master_cpa_no_match)
  end

  test "should destroy master_cpa_no_match" do
    assert_difference('MasterCpaNoMatch.count', -1) do
      delete master_cpa_no_match_url(@master_cpa_no_match)
    end

    assert_redirected_to master_cpa_no_matches_url
  end
end
