require "test_helper"

class EmpireMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_member = empire_members(:one)
  end

  test "should get index" do
    get empire_members_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_member_url
    assert_response :success
  end

  test "should create empire_member" do
    assert_difference('EmpireMember.count') do
      post empire_members_url, params: { empire_member: { first_purchase: @empire_member.first_purchase, last_purchase: @empire_member.last_purchase, lname: @empire_member.lname, purchases: @empire_member.purchases, state: @empire_member.state, uid: @empire_member.uid } }
    end

    assert_redirected_to empire_member_url(EmpireMember.last)
  end

  test "should show empire_member" do
    get empire_member_url(@empire_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_member_url(@empire_member)
    assert_response :success
  end

  test "should update empire_member" do
    patch empire_member_url(@empire_member), params: { empire_member: { first_purchase: @empire_member.first_purchase, last_purchase: @empire_member.last_purchase, lname: @empire_member.lname, purchases: @empire_member.purchases, state: @empire_member.state, uid: @empire_member.uid } }
    assert_redirected_to empire_member_url(@empire_member)
  end

  test "should destroy empire_member" do
    assert_difference('EmpireMember.count', -1) do
      delete empire_member_url(@empire_member)
    end

    assert_redirected_to empire_members_url
  end
end
