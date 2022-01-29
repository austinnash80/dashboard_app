require "test_helper"

class EmpireMasterIlMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_il_match = empire_master_il_matches(:one)
  end

  test "should get index" do
    get empire_master_il_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_il_match_url
    assert_response :success
  end

  test "should create empire_master_il_match" do
    assert_difference('EmpireMasterIlMatch.count') do
      post empire_master_il_matches_url, params: { empire_master_il_match: { exp: @empire_master_il_match.exp, lic: @empire_master_il_match.lic, lid: @empire_master_il_match.lid, list: @empire_master_il_match.list, lname: @empire_master_il_match.lname, search_date: @empire_master_il_match.search_date, st: @empire_master_il_match.st, uid: @empire_master_il_match.uid } }
    end

    assert_redirected_to empire_master_il_match_url(EmpireMasterIlMatch.last)
  end

  test "should show empire_master_il_match" do
    get empire_master_il_match_url(@empire_master_il_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_il_match_url(@empire_master_il_match)
    assert_response :success
  end

  test "should update empire_master_il_match" do
    patch empire_master_il_match_url(@empire_master_il_match), params: { empire_master_il_match: { exp: @empire_master_il_match.exp, lic: @empire_master_il_match.lic, lid: @empire_master_il_match.lid, list: @empire_master_il_match.list, lname: @empire_master_il_match.lname, search_date: @empire_master_il_match.search_date, st: @empire_master_il_match.st, uid: @empire_master_il_match.uid } }
    assert_redirected_to empire_master_il_match_url(@empire_master_il_match)
  end

  test "should destroy empire_master_il_match" do
    assert_difference('EmpireMasterIlMatch.count', -1) do
      delete empire_master_il_match_url(@empire_master_il_match)
    end

    assert_redirected_to empire_master_il_matches_url
  end
end
