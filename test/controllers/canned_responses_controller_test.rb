require "test_helper"

class CannedResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @canned_response = canned_responses(:one)
  end

  test "should get index" do
    get canned_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_canned_response_url
    assert_response :success
  end

  test "should create canned_response" do
    assert_difference('CannedResponse.count') do
      post canned_responses_url, params: { canned_response: { answer: @canned_response.answer, company: @canned_response.company, des: @canned_response.des, notes: @canned_response.notes, questions: @canned_response.questions, state: @canned_response.state } }
    end

    assert_redirected_to canned_response_url(CannedResponse.last)
  end

  test "should show canned_response" do
    get canned_response_url(@canned_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_canned_response_url(@canned_response)
    assert_response :success
  end

  test "should update canned_response" do
    patch canned_response_url(@canned_response), params: { canned_response: { answer: @canned_response.answer, company: @canned_response.company, des: @canned_response.des, notes: @canned_response.notes, questions: @canned_response.questions, state: @canned_response.state } }
    assert_redirected_to canned_response_url(@canned_response)
  end

  test "should destroy canned_response" do
    assert_difference('CannedResponse.count', -1) do
      delete canned_response_url(@canned_response)
    end

    assert_redirected_to canned_responses_url
  end
end
