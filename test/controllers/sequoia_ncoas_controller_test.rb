require "test_helper"

class SequoiaNcoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequoia_ncoa = sequoia_ncoas(:one)
  end

  test "should get index" do
    get sequoia_ncoas_url
    assert_response :success
  end

  test "should get new" do
    get new_sequoia_ncoa_url
    assert_response :success
  end

  test "should create sequoia_ncoa" do
    assert_difference('SequoiaNcoa.count') do
      post sequoia_ncoas_url, params: { sequoia_ncoa: { bad: @sequoia_ncoa.bad, city: @sequoia_ncoa.city, good: @sequoia_ncoa.good, ncoa_list: @sequoia_ncoa.ncoa_list, state: @sequoia_ncoa.state, stree_1: @sequoia_ncoa.stree_1, street_2: @sequoia_ncoa.street_2, uid: @sequoia_ncoa.uid, zip: @sequoia_ncoa.zip } }
    end

    assert_redirected_to sequoia_ncoa_url(SequoiaNcoa.last)
  end

  test "should show sequoia_ncoa" do
    get sequoia_ncoa_url(@sequoia_ncoa)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequoia_ncoa_url(@sequoia_ncoa)
    assert_response :success
  end

  test "should update sequoia_ncoa" do
    patch sequoia_ncoa_url(@sequoia_ncoa), params: { sequoia_ncoa: { bad: @sequoia_ncoa.bad, city: @sequoia_ncoa.city, good: @sequoia_ncoa.good, ncoa_list: @sequoia_ncoa.ncoa_list, state: @sequoia_ncoa.state, stree_1: @sequoia_ncoa.stree_1, street_2: @sequoia_ncoa.street_2, uid: @sequoia_ncoa.uid, zip: @sequoia_ncoa.zip } }
    assert_redirected_to sequoia_ncoa_url(@sequoia_ncoa)
  end

  test "should destroy sequoia_ncoa" do
    assert_difference('SequoiaNcoa.count', -1) do
      delete sequoia_ncoa_url(@sequoia_ncoa)
    end

    assert_redirected_to sequoia_ncoas_url
  end
end
