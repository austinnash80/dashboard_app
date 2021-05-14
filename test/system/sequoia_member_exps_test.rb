require "application_system_test_case"

class SequoiaMemberExpsTest < ApplicationSystemTestCase
  setup do
    @sequoia_member_exp = sequoia_member_exps(:one)
  end

  test "visiting the index" do
    visit sequoia_member_exps_url
    assert_selector "h1", text: "Sequoia Member Exps"
  end

  test "creating a Sequoia member exp" do
    visit sequoia_member_exps_url
    click_on "New Sequoia Member Exp"

    fill_in "Last membership", with: @sequoia_member_exp.last_membership
    fill_in "Membership", with: @sequoia_member_exp.membership
    fill_in "Membership exp", with: @sequoia_member_exp.membership_exp
    fill_in "Uid", with: @sequoia_member_exp.uid
    click_on "Create Sequoia member exp"

    assert_text "Sequoia member exp was successfully created"
    click_on "Back"
  end

  test "updating a Sequoia member exp" do
    visit sequoia_member_exps_url
    click_on "Edit", match: :first

    fill_in "Last membership", with: @sequoia_member_exp.last_membership
    fill_in "Membership", with: @sequoia_member_exp.membership
    fill_in "Membership exp", with: @sequoia_member_exp.membership_exp
    fill_in "Uid", with: @sequoia_member_exp.uid
    click_on "Update Sequoia member exp"

    assert_text "Sequoia member exp was successfully updated"
    click_on "Back"
  end

  test "destroying a Sequoia member exp" do
    visit sequoia_member_exps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sequoia member exp was successfully destroyed"
  end
end
