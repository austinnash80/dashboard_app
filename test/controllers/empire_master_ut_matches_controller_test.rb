require "test_helper"

class EmpireMasterUtMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_ut_match = empire_master_ut_matches(:one)
  end

  test "should get index" do
    get empire_master_ut_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_ut_match_url
    assert_response :success
  end

  test "should create empire_master_ut_match" do
    assert_difference('EmpireMasterUtMatch.count') do
      post empire_master_ut_matches_url, params: { empire_master_ut_match: { exp: @empire_master_ut_match.exp, lic: @empire_master_ut_match.lic, lid: @empire_master_ut_match.lid, list: @empire_master_ut_match.list, lname: @empire_master_ut_match.lname, search_date: @empire_master_ut_match.search_date, st: @empire_master_ut_match.st, uid: @empire_master_ut_match.uid } }
    end

    assert_redirected_to empire_master_ut_match_url(EmpireMasterUtMatch.last)
  end

  test "should show empire_master_ut_match" do
    get empire_master_ut_match_url(@empire_master_ut_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_ut_match_url(@empire_master_ut_match)
    assert_response :success
  end

  test "should update empire_master_ut_match" do
    patch empire_master_ut_match_url(@empire_master_ut_match), params: { empire_master_ut_match: { exp: @empire_master_ut_match.exp, lic: @empire_master_ut_match.lic, lid: @empire_master_ut_match.lid, list: @empire_master_ut_match.list, lname: @empire_master_ut_match.lname, search_date: @empire_master_ut_match.search_date, st: @empire_master_ut_match.st, uid: @empire_master_ut_match.uid } }
    assert_redirected_to empire_master_ut_match_url(@empire_master_ut_match)
  end

  test "should destroy empire_master_ut_match" do
    assert_difference('EmpireMasterUtMatch.count', -1) do
      delete empire_master_ut_match_url(@empire_master_ut_match)
    end

    assert_redirected_to empire_master_ut_matches_url
  end
end
