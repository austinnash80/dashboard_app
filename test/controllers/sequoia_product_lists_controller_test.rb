require "test_helper"

class SequoiaProductListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequoia_product_list = sequoia_product_lists(:one)
  end

  test "should get index" do
    get sequoia_product_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_sequoia_product_list_url
    assert_response :success
  end

  test "should create sequoia_product_list" do
    assert_difference('SequoiaProductList.count') do
      post sequoia_product_lists_url, params: { sequoia_product_list: { product: @sequoia_product_list.product, type: @sequoia_product_list.type, who: @sequoia_product_list.who } }
    end

    assert_redirected_to sequoia_product_list_url(SequoiaProductList.last)
  end

  test "should show sequoia_product_list" do
    get sequoia_product_list_url(@sequoia_product_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequoia_product_list_url(@sequoia_product_list)
    assert_response :success
  end

  test "should update sequoia_product_list" do
    patch sequoia_product_list_url(@sequoia_product_list), params: { sequoia_product_list: { product: @sequoia_product_list.product, type: @sequoia_product_list.type, who: @sequoia_product_list.who } }
    assert_redirected_to sequoia_product_list_url(@sequoia_product_list)
  end

  test "should destroy sequoia_product_list" do
    assert_difference('SequoiaProductList.count', -1) do
      delete sequoia_product_list_url(@sequoia_product_list)
    end

    assert_redirected_to sequoia_product_lists_url
  end
end
