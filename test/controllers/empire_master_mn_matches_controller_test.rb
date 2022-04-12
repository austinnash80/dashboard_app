require "test_helper"

class EmpireMasterMnMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_mn_match = empire_master_mn_matches(:one)
  end

  test "should get index" do
    get empire_master_mn_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_mn_match_url
    assert_response :success
  end

  test "should create empire_master_mn_match" do
    assert_difference('EmpireMasterMnMatch.count') do
      post empire_master_mn_matches_url, params: { empire_master_mn_match: { exp: @empire_master_mn_match.exp, lic: @empire_master_mn_match.lic, lid: @empire_master_mn_match.lid, list: @empire_master_mn_match.list, lname: @empire_master_mn_match.lname, search_date: @empire_master_mn_match.search_date, st: @empire_master_mn_match.st, uid: @empire_master_mn_match.uid } }
    end

    assert_redirected_to empire_master_mn_match_url(EmpireMasterMnMatch.last)
  end

  test "should show empire_master_mn_match" do
    get empire_master_mn_match_url(@empire_master_mn_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_mn_match_url(@empire_master_mn_match)
    assert_response :success
  end

  test "should update empire_master_mn_match" do
    patch empire_master_mn_match_url(@empire_master_mn_match), params: { empire_master_mn_match: { exp: @empire_master_mn_match.exp, lic: @empire_master_mn_match.lic, lid: @empire_master_mn_match.lid, list: @empire_master_mn_match.list, lname: @empire_master_mn_match.lname, search_date: @empire_master_mn_match.search_date, st: @empire_master_mn_match.st, uid: @empire_master_mn_match.uid } }
    assert_redirected_to empire_master_mn_match_url(@empire_master_mn_match)
  end

  test "should destroy empire_master_mn_match" do
    assert_difference('EmpireMasterMnMatch.count', -1) do
      delete empire_master_mn_match_url(@empire_master_mn_match)
    end

    assert_redirected_to empire_master_mn_matches_url
  end
end
