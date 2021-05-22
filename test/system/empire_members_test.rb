require "application_system_test_case"

class EmpireMembersTest < ApplicationSystemTestCase
  setup do
    @empire_member = empire_members(:one)
  end

  test "visiting the index" do
    visit empire_members_url
    assert_selector "h1", text: "Empire Members"
  end

  test "creating a Empire member" do
    visit empire_members_url
    click_on "New Empire Member"

    fill_in "First purchase", with: @empire_member.first_purchase
    fill_in "Last purchase", with: @empire_member.last_purchase
    fill_in "Lname", with: @empire_member.lname
    fill_in "Purchases", with: @empire_member.purchases
    fill_in "State", with: @empire_member.state
    fill_in "Uid", with: @empire_member.uid
    click_on "Create Empire member"

    assert_text "Empire member was successfully created"
    click_on "Back"
  end

  test "updating a Empire member" do
    visit empire_members_url
    click_on "Edit", match: :first

    fill_in "First purchase", with: @empire_member.first_purchase
    fill_in "Last purchase", with: @empire_member.last_purchase
    fill_in "Lname", with: @empire_member.lname
    fill_in "Purchases", with: @empire_member.purchases
    fill_in "State", with: @empire_member.state
    fill_in "Uid", with: @empire_member.uid
    click_on "Update Empire member"

    assert_text "Empire member was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire member" do
    visit empire_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire member was successfully destroyed"
  end
end
