require "test_helper"

class SequoiaMemberExpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequoia_member_exp = sequoia_member_exps(:one)
  end

  test "should get index" do
    get sequoia_member_exps_url
    assert_response :success
  end

  test "should get new" do
    get new_sequoia_member_exp_url
    assert_response :success
  end

  test "should create sequoia_member_exp" do
    assert_difference('SequoiaMemberExp.count') do
      post sequoia_member_exps_url, params: { sequoia_member_exp: { last_membership: @sequoia_member_exp.last_membership, membership: @sequoia_member_exp.membership, membership_exp: @sequoia_member_exp.membership_exp, uid: @sequoia_member_exp.uid } }
    end

    assert_redirected_to sequoia_member_exp_url(SequoiaMemberExp.last)
  end

  test "should show sequoia_member_exp" do
    get sequoia_member_exp_url(@sequoia_member_exp)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequoia_member_exp_url(@sequoia_member_exp)
    assert_response :success
  end

  test "should update sequoia_member_exp" do
    patch sequoia_member_exp_url(@sequoia_member_exp), params: { sequoia_member_exp: { last_membership: @sequoia_member_exp.last_membership, membership: @sequoia_member_exp.membership, membership_exp: @sequoia_member_exp.membership_exp, uid: @sequoia_member_exp.uid } }
    assert_redirected_to sequoia_member_exp_url(@sequoia_member_exp)
  end

  test "should destroy sequoia_member_exp" do
    assert_difference('SequoiaMemberExp.count', -1) do
      delete sequoia_member_exp_url(@sequoia_member_exp)
    end

    assert_redirected_to sequoia_member_exps_url
  end
end
