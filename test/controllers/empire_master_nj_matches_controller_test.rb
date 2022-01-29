require "test_helper"

class EmpireMasterNjMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_nj_match = empire_master_nj_matches(:one)
  end

  test "should get index" do
    get empire_master_nj_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_nj_match_url
    assert_response :success
  end

  test "should create empire_master_nj_match" do
    assert_difference('EmpireMasterNjMatch.count') do
      post empire_master_nj_matches_url, params: { empire_master_nj_match: { exp: @empire_master_nj_match.exp, lic: @empire_master_nj_match.lic, lid: @empire_master_nj_match.lid, list: @empire_master_nj_match.list, lname: @empire_master_nj_match.lname, search_date: @empire_master_nj_match.search_date, st: @empire_master_nj_match.st, uid: @empire_master_nj_match.uid } }
    end

    assert_redirected_to empire_master_nj_match_url(EmpireMasterNjMatch.last)
  end

  test "should show empire_master_nj_match" do
    get empire_master_nj_match_url(@empire_master_nj_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_nj_match_url(@empire_master_nj_match)
    assert_response :success
  end

  test "should update empire_master_nj_match" do
    patch empire_master_nj_match_url(@empire_master_nj_match), params: { empire_master_nj_match: { exp: @empire_master_nj_match.exp, lic: @empire_master_nj_match.lic, lid: @empire_master_nj_match.lid, list: @empire_master_nj_match.list, lname: @empire_master_nj_match.lname, search_date: @empire_master_nj_match.search_date, st: @empire_master_nj_match.st, uid: @empire_master_nj_match.uid } }
    assert_redirected_to empire_master_nj_match_url(@empire_master_nj_match)
  end

  test "should destroy empire_master_nj_match" do
    assert_difference('EmpireMasterNjMatch.count', -1) do
      delete empire_master_nj_match_url(@empire_master_nj_match)
    end

    assert_redirected_to empire_master_nj_matches_url
  end
end
