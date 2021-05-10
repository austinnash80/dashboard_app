require "application_system_test_case"

class SequoiaMembersTest < ApplicationSystemTestCase
  setup do
    @sequoia_member = sequoia_members(:one)
  end

  test "visiting the index" do
    visit sequoia_members_url
    assert_selector "h1", text: "Sequoia Members"
  end

  test "creating a Sequoia member" do
    visit sequoia_members_url
    click_on "New Sequoia Member"

    check "Afsp" if @sequoia_member.afsp
    fill_in "Afsp purchases", with: @sequoia_member.afsp_purchases
    check "Cpa" if @sequoia_member.cpa
    fill_in "Cpa memberships", with: @sequoia_member.cpa_memberships
    check "Ea" if @sequoia_member.ea
    check "Ethics" if @sequoia_member.ethics
    fill_in "Ethics purchases", with: @sequoia_member.ethics_purchases
    fill_in "First purchase", with: @sequoia_member.first_purchase
    fill_in "Last purchase", with: @sequoia_member.last_purchase
    fill_in "Lname", with: @sequoia_member.lname
    fill_in "Memberships", with: @sequoia_member.memberships
    fill_in "Uid", with: @sequoia_member.uid
    click_on "Create Sequoia member"

    assert_text "Sequoia member was successfully created"
    click_on "Back"
  end

  test "updating a Sequoia member" do
    visit sequoia_members_url
    click_on "Edit", match: :first

    check "Afsp" if @sequoia_member.afsp
    fill_in "Afsp purchases", with: @sequoia_member.afsp_purchases
    check "Cpa" if @sequoia_member.cpa
    fill_in "Cpa memberships", with: @sequoia_member.cpa_memberships
    check "Ea" if @sequoia_member.ea
    check "Ethics" if @sequoia_member.ethics
    fill_in "Ethics purchases", with: @sequoia_member.ethics_purchases
    fill_in "First purchase", with: @sequoia_member.first_purchase
    fill_in "Last purchase", with: @sequoia_member.last_purchase
    fill_in "Lname", with: @sequoia_member.lname
    fill_in "Memberships", with: @sequoia_member.memberships
    fill_in "Uid", with: @sequoia_member.uid
    click_on "Update Sequoia member"

    assert_text "Sequoia member was successfully updated"
    click_on "Back"
  end

  test "destroying a Sequoia member" do
    visit sequoia_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sequoia member was successfully destroyed"
  end
end
