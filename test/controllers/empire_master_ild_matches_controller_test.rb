require "test_helper"

class EmpireMasterIldMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_ild_match = empire_master_ild_matches(:one)
  end

  test "should get index" do
    get empire_master_ild_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_ild_match_url
    assert_response :success
  end

  test "should create empire_master_ild_match" do
    assert_difference('EmpireMasterIldMatch.count') do
      post empire_master_ild_matches_url, params: { empire_master_ild_match: { exp: @empire_master_ild_match.exp, lic: @empire_master_ild_match.lic, lid: @empire_master_ild_match.lid, list: @empire_master_ild_match.list, lname: @empire_master_ild_match.lname, search_date: @empire_master_ild_match.search_date, st: @empire_master_ild_match.st, uid: @empire_master_ild_match.uid } }
    end

    assert_redirected_to empire_master_ild_match_url(EmpireMasterIldMatch.last)
  end

  test "should show empire_master_ild_match" do
    get empire_master_ild_match_url(@empire_master_ild_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_ild_match_url(@empire_master_ild_match)
    assert_response :success
  end

  test "should update empire_master_ild_match" do
    patch empire_master_ild_match_url(@empire_master_ild_match), params: { empire_master_ild_match: { exp: @empire_master_ild_match.exp, lic: @empire_master_ild_match.lic, lid: @empire_master_ild_match.lid, list: @empire_master_ild_match.list, lname: @empire_master_ild_match.lname, search_date: @empire_master_ild_match.search_date, st: @empire_master_ild_match.st, uid: @empire_master_ild_match.uid } }
    assert_redirected_to empire_master_ild_match_url(@empire_master_ild_match)
  end

  test "should destroy empire_master_ild_match" do
    assert_difference('EmpireMasterIldMatch.count', -1) do
      delete empire_master_ild_match_url(@empire_master_ild_match)
    end

    assert_redirected_to empire_master_ild_matches_url
  end
end
