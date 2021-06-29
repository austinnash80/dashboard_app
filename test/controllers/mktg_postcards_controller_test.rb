require "test_helper"

class MktgPostcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mktg_postcard = mktg_postcards(:one)
  end

  test "should get index" do
    get mktg_postcards_url
    assert_response :success
  end

  test "should get new" do
    get new_mktg_postcard_url
    assert_response :success
  end

  test "should create mktg_postcard" do
    assert_difference('MktgPostcard.count') do
      post mktg_postcards_url, params: { mktg_postcard: { campaign: @mktg_postcard.campaign, company: @mktg_postcard.company, cpa_sent: @mktg_postcard.cpa_sent, done: @mktg_postcard.done, ea_sent: @mktg_postcard.ea_sent, mail_day: @mktg_postcard.mail_day, notes: @mktg_postcard.notes, range_1_a: @mktg_postcard.range_1_a, range_1_b: @mktg_postcard.range_1_b, range_2_a: @mktg_postcard.range_2_a, range_2_b: @mktg_postcard.range_2_b } }
    end

    assert_redirected_to mktg_postcard_url(MktgPostcard.last)
  end

  test "should show mktg_postcard" do
    get mktg_postcard_url(@mktg_postcard)
    assert_response :success
  end

  test "should get edit" do
    get edit_mktg_postcard_url(@mktg_postcard)
    assert_response :success
  end

  test "should update mktg_postcard" do
    patch mktg_postcard_url(@mktg_postcard), params: { mktg_postcard: { campaign: @mktg_postcard.campaign, company: @mktg_postcard.company, cpa_sent: @mktg_postcard.cpa_sent, done: @mktg_postcard.done, ea_sent: @mktg_postcard.ea_sent, mail_day: @mktg_postcard.mail_day, notes: @mktg_postcard.notes, range_1_a: @mktg_postcard.range_1_a, range_1_b: @mktg_postcard.range_1_b, range_2_a: @mktg_postcard.range_2_a, range_2_b: @mktg_postcard.range_2_b } }
    assert_redirected_to mktg_postcard_url(@mktg_postcard)
  end

  test "should destroy mktg_postcard" do
    assert_difference('MktgPostcard.count', -1) do
      delete mktg_postcard_url(@mktg_postcard)
    end

    assert_redirected_to mktg_postcards_url
  end
end
