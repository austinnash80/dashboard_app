require "test_helper"

class EmpireManualMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_manual_match = empire_manual_matches(:one)
  end

  test "should get index" do
    get empire_manual_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_manual_match_url
    assert_response :success
  end

  test "should create empire_manual_match" do
    assert_difference('EmpireManualMatch.count') do
      post empire_manual_matches_url, params: { empire_manual_match: { lic: @empire_manual_match.lic, lid: @empire_manual_match.lid, list: @empire_manual_match.list, lname: @empire_manual_match.lname, match: @empire_manual_match.match, uid: @empire_manual_match.uid } }
    end

    assert_redirected_to empire_manual_match_url(EmpireManualMatch.last)
  end

  test "should show empire_manual_match" do
    get empire_manual_match_url(@empire_manual_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_manual_match_url(@empire_manual_match)
    assert_response :success
  end

  test "should update empire_manual_match" do
    patch empire_manual_match_url(@empire_manual_match), params: { empire_manual_match: { lic: @empire_manual_match.lic, lid: @empire_manual_match.lid, list: @empire_manual_match.list, lname: @empire_manual_match.lname, match: @empire_manual_match.match, uid: @empire_manual_match.uid } }
    assert_redirected_to empire_manual_match_url(@empire_manual_match)
  end

  test "should destroy empire_manual_match" do
    assert_difference('EmpireManualMatch.count', -1) do
      delete empire_manual_match_url(@empire_manual_match)
    end

    assert_redirected_to empire_manual_matches_url
  end
end
