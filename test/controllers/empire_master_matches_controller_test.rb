require "test_helper"

class EmpireMasterMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_master_match = empire_master_matches(:one)
  end

  test "should get index" do
    get empire_master_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_master_match_url
    assert_response :success
  end

  test "should create empire_master_match" do
    assert_difference('EmpireMasterMatch.count') do
      post empire_master_matches_url, params: { empire_master_match: { lic_st: @empire_master_match.lic_st, lid: @empire_master_match.lid, list: @empire_master_match.list, search_date: @empire_master_match.search_date, uid: @empire_master_match.uid } }
    end

    assert_redirected_to empire_master_match_url(EmpireMasterMatch.last)
  end

  test "should show empire_master_match" do
    get empire_master_match_url(@empire_master_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_master_match_url(@empire_master_match)
    assert_response :success
  end

  test "should update empire_master_match" do
    patch empire_master_match_url(@empire_master_match), params: { empire_master_match: { lic_st: @empire_master_match.lic_st, lid: @empire_master_match.lid, list: @empire_master_match.list, search_date: @empire_master_match.search_date, uid: @empire_master_match.uid } }
    assert_redirected_to empire_master_match_url(@empire_master_match)
  end

  test "should destroy empire_master_match" do
    assert_difference('EmpireMasterMatch.count', -1) do
      delete empire_master_match_url(@empire_master_match)
    end

    assert_redirected_to empire_master_matches_url
  end
end
