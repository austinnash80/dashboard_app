require "test_helper"

class MasterEaNoMailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_ea_no_mail = master_ea_no_mails(:one)
  end

  test "should get index" do
    get master_ea_no_mails_url
    assert_response :success
  end

  test "should get new" do
    get new_master_ea_no_mail_url
    assert_response :success
  end

  test "should create master_ea_no_mail" do
    assert_difference('MasterEaNoMail.count') do
      post master_ea_no_mails_url, params: { master_ea_no_mail: { lid: @master_ea_no_mail.lid, list: @master_ea_no_mail.list, lname: @master_ea_no_mail.lname, search_date: @master_ea_no_mail.search_date } }
    end

    assert_redirected_to master_ea_no_mail_url(MasterEaNoMail.last)
  end

  test "should show master_ea_no_mail" do
    get master_ea_no_mail_url(@master_ea_no_mail)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_ea_no_mail_url(@master_ea_no_mail)
    assert_response :success
  end

  test "should update master_ea_no_mail" do
    patch master_ea_no_mail_url(@master_ea_no_mail), params: { master_ea_no_mail: { lid: @master_ea_no_mail.lid, list: @master_ea_no_mail.list, lname: @master_ea_no_mail.lname, search_date: @master_ea_no_mail.search_date } }
    assert_redirected_to master_ea_no_mail_url(@master_ea_no_mail)
  end

  test "should destroy master_ea_no_mail" do
    assert_difference('MasterEaNoMail.count', -1) do
      delete master_ea_no_mail_url(@master_ea_no_mail)
    end

    assert_redirected_to master_ea_no_mails_url
  end
end
