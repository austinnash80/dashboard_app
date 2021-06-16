require "application_system_test_case"

class CannedResponsesTest < ApplicationSystemTestCase
  setup do
    @canned_response = canned_responses(:one)
  end

  test "visiting the index" do
    visit canned_responses_url
    assert_selector "h1", text: "Canned Responses"
  end

  test "creating a Canned response" do
    visit canned_responses_url
    click_on "New Canned Response"

    fill_in "Answer", with: @canned_response.answer
    fill_in "Company", with: @canned_response.company
    fill_in "Des", with: @canned_response.des
    fill_in "Notes", with: @canned_response.notes
    fill_in "Questions", with: @canned_response.questions
    fill_in "State", with: @canned_response.state
    click_on "Create Canned response"

    assert_text "Canned response was successfully created"
    click_on "Back"
  end

  test "updating a Canned response" do
    visit canned_responses_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @canned_response.answer
    fill_in "Company", with: @canned_response.company
    fill_in "Des", with: @canned_response.des
    fill_in "Notes", with: @canned_response.notes
    fill_in "Questions", with: @canned_response.questions
    fill_in "State", with: @canned_response.state
    click_on "Update Canned response"

    assert_text "Canned response was successfully updated"
    click_on "Back"
  end

  test "destroying a Canned response" do
    visit canned_responses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Canned response was successfully destroyed"
  end
end
