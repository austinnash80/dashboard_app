require "test_helper"

class MasterEaNoMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_ea_no_match = master_ea_no_matches(:one)
  end

  test "should get index" do
    get master_ea_no_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_master_ea_no_match_url
    assert_response :success
  end

  test "should create master_ea_no_match" do
    assert_difference('MasterEaNoMatch.count') do
      post master_ea_no_matches_url, params: { master_ea_no_match: { list: @master_ea_no_match.list, lname: @master_ea_no_match.lname, search_date: @master_ea_no_match.search_date, uid: @master_ea_no_match.uid } }
    end

    assert_redirected_to master_ea_no_match_url(MasterEaNoMatch.last)
  end

  test "should show master_ea_no_match" do
    get master_ea_no_match_url(@master_ea_no_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_ea_no_match_url(@master_ea_no_match)
    assert_response :success
  end

  test "should update master_ea_no_match" do
    patch master_ea_no_match_url(@master_ea_no_match), params: { master_ea_no_match: { list: @master_ea_no_match.list, lname: @master_ea_no_match.lname, search_date: @master_ea_no_match.search_date, uid: @master_ea_no_match.uid } }
    assert_redirected_to master_ea_no_match_url(@master_ea_no_match)
  end

  test "should destroy master_ea_no_match" do
    assert_difference('MasterEaNoMatch.count', -1) do
      delete master_ea_no_match_url(@master_ea_no_match)
    end

    assert_redirected_to master_ea_no_matches_url
  end
end
