require "test_helper"

class SequoiaMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequoia_member = sequoia_members(:one)
  end

  test "should get index" do
    get sequoia_members_url
    assert_response :success
  end

  test "should get new" do
    get new_sequoia_member_url
    assert_response :success
  end

  test "should create sequoia_member" do
    assert_difference('SequoiaMember.count') do
      post sequoia_members_url, params: { sequoia_member: { afsp: @sequoia_member.afsp, afsp_purchases: @sequoia_member.afsp_purchases, cpa: @sequoia_member.cpa, cpa_memberships: @sequoia_member.cpa_memberships, ea: @sequoia_member.ea, ethics: @sequoia_member.ethics, ethics_purchases: @sequoia_member.ethics_purchases, first_purchase: @sequoia_member.first_purchase, last_purchase: @sequoia_member.last_purchase, lname: @sequoia_member.lname, memberships: @sequoia_member.memberships, uid: @sequoia_member.uid } }
    end

    assert_redirected_to sequoia_member_url(SequoiaMember.last)
  end

  test "should show sequoia_member" do
    get sequoia_member_url(@sequoia_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequoia_member_url(@sequoia_member)
    assert_response :success
  end

  test "should update sequoia_member" do
    patch sequoia_member_url(@sequoia_member), params: { sequoia_member: { afsp: @sequoia_member.afsp, afsp_purchases: @sequoia_member.afsp_purchases, cpa: @sequoia_member.cpa, cpa_memberships: @sequoia_member.cpa_memberships, ea: @sequoia_member.ea, ethics: @sequoia_member.ethics, ethics_purchases: @sequoia_member.ethics_purchases, first_purchase: @sequoia_member.first_purchase, last_purchase: @sequoia_member.last_purchase, lname: @sequoia_member.lname, memberships: @sequoia_member.memberships, uid: @sequoia_member.uid } }
    assert_redirected_to sequoia_member_url(@sequoia_member)
  end

  test "should destroy sequoia_member" do
    assert_difference('SequoiaMember.count', -1) do
      delete sequoia_member_url(@sequoia_member)
    end

    assert_redirected_to sequoia_members_url
  end
end
