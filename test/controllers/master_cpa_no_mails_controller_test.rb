require "test_helper"

class MasterCpaNoMailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_cpa_no_mail = master_cpa_no_mails(:one)
  end

  test "should get index" do
    get master_cpa_no_mails_url
    assert_response :success
  end

  test "should get new" do
    get new_master_cpa_no_mail_url
    assert_response :success
  end

  test "should create master_cpa_no_mail" do
    assert_difference('MasterCpaNoMail.count') do
      post master_cpa_no_mails_url, params: { master_cpa_no_mail: { lid: @master_cpa_no_mail.lid, list: @master_cpa_no_mail.list, lname: @master_cpa_no_mail.lname, search_date: @master_cpa_no_mail.search_date } }
    end

    assert_redirected_to master_cpa_no_mail_url(MasterCpaNoMail.last)
  end

  test "should show master_cpa_no_mail" do
    get master_cpa_no_mail_url(@master_cpa_no_mail)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_cpa_no_mail_url(@master_cpa_no_mail)
    assert_response :success
  end

  test "should update master_cpa_no_mail" do
    patch master_cpa_no_mail_url(@master_cpa_no_mail), params: { master_cpa_no_mail: { lid: @master_cpa_no_mail.lid, list: @master_cpa_no_mail.list, lname: @master_cpa_no_mail.lname, search_date: @master_cpa_no_mail.search_date } }
    assert_redirected_to master_cpa_no_mail_url(@master_cpa_no_mail)
  end

  test "should destroy master_cpa_no_mail" do
    assert_difference('MasterCpaNoMail.count', -1) do
      delete master_cpa_no_mail_url(@master_cpa_no_mail)
    end

    assert_redirected_to master_cpa_no_mails_url
  end
end
