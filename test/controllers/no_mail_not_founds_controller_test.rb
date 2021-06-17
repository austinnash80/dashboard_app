require "test_helper"

class NoMailNotFoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @no_mail_not_found = no_mail_not_founds(:one)
  end

  test "should get index" do
    get no_mail_not_founds_url
    assert_response :success
  end

  test "should get new" do
    get new_no_mail_not_found_url
    assert_response :success
  end

  test "should create no_mail_not_found" do
    assert_difference('NoMailNotFound.count') do
      post no_mail_not_founds_url, params: { no_mail_not_found: { add: @no_mail_not_found.add, add2: @no_mail_not_found.add2, city: @no_mail_not_found.city, co: @no_mail_not_found.co, company: @no_mail_not_found.company, des: @no_mail_not_found.des, fname: @no_mail_not_found.fname, lic_state: @no_mail_not_found.lic_state, lname: @no_mail_not_found.lname, mi: @no_mail_not_found.mi, note: @no_mail_not_found.note, state: @no_mail_not_found.state, suf: @no_mail_not_found.suf, zip: @no_mail_not_found.zip } }
    end

    assert_redirected_to no_mail_not_found_url(NoMailNotFound.last)
  end

  test "should show no_mail_not_found" do
    get no_mail_not_found_url(@no_mail_not_found)
    assert_response :success
  end

  test "should get edit" do
    get edit_no_mail_not_found_url(@no_mail_not_found)
    assert_response :success
  end

  test "should update no_mail_not_found" do
    patch no_mail_not_found_url(@no_mail_not_found), params: { no_mail_not_found: { add: @no_mail_not_found.add, add2: @no_mail_not_found.add2, city: @no_mail_not_found.city, co: @no_mail_not_found.co, company: @no_mail_not_found.company, des: @no_mail_not_found.des, fname: @no_mail_not_found.fname, lic_state: @no_mail_not_found.lic_state, lname: @no_mail_not_found.lname, mi: @no_mail_not_found.mi, note: @no_mail_not_found.note, state: @no_mail_not_found.state, suf: @no_mail_not_found.suf, zip: @no_mail_not_found.zip } }
    assert_redirected_to no_mail_not_found_url(@no_mail_not_found)
  end

  test "should destroy no_mail_not_found" do
    assert_difference('NoMailNotFound.count', -1) do
      delete no_mail_not_found_url(@no_mail_not_found)
    end

    assert_redirected_to no_mail_not_founds_url
  end
end
