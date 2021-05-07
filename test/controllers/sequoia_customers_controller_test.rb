require "test_helper"

class SequoiaCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequoia_customer = sequoia_customers(:one)
  end

  test "should get index" do
    get sequoia_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_sequoia_customer_url
    assert_response :success
  end

  test "should create sequoia_customer" do
    assert_difference('SequoiaCustomer.count') do
      post sequoia_customers_url, params: { sequoia_customer: { city: @sequoia_customer.city, designation: @sequoia_customer.designation, email: @sequoia_customer.email, exisiting: @sequoia_customer.exisiting, fname: @sequoia_customer.fname, lic_num: @sequoia_customer.lic_num, lic_state: @sequoia_customer.lic_state, lname: @sequoia_customer.lname, order_id: @sequoia_customer.order_id, price: @sequoia_customer.price, price_s: @sequoia_customer.price_s, product_1: @sequoia_customer.product_1, product_2: @sequoia_customer.product_2, purchase: @sequoia_customer.purchase, purchase_s: @sequoia_customer.purchase_s, s_id: @sequoia_customer.s_id, state: @sequoia_customer.state, street_1: @sequoia_customer.street_1, street_2: @sequoia_customer.street_2, uid: @sequoia_customer.uid, zip: @sequoia_customer.zip } }
    end

    assert_redirected_to sequoia_customer_url(SequoiaCustomer.last)
  end

  test "should show sequoia_customer" do
    get sequoia_customer_url(@sequoia_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequoia_customer_url(@sequoia_customer)
    assert_response :success
  end

  test "should update sequoia_customer" do
    patch sequoia_customer_url(@sequoia_customer), params: { sequoia_customer: { city: @sequoia_customer.city, designation: @sequoia_customer.designation, email: @sequoia_customer.email, exisiting: @sequoia_customer.exisiting, fname: @sequoia_customer.fname, lic_num: @sequoia_customer.lic_num, lic_state: @sequoia_customer.lic_state, lname: @sequoia_customer.lname, order_id: @sequoia_customer.order_id, price: @sequoia_customer.price, price_s: @sequoia_customer.price_s, product_1: @sequoia_customer.product_1, product_2: @sequoia_customer.product_2, purchase: @sequoia_customer.purchase, purchase_s: @sequoia_customer.purchase_s, s_id: @sequoia_customer.s_id, state: @sequoia_customer.state, street_1: @sequoia_customer.street_1, street_2: @sequoia_customer.street_2, uid: @sequoia_customer.uid, zip: @sequoia_customer.zip } }
    assert_redirected_to sequoia_customer_url(@sequoia_customer)
  end

  test "should destroy sequoia_customer" do
    assert_difference('SequoiaCustomer.count', -1) do
      delete sequoia_customer_url(@sequoia_customer)
    end

    assert_redirected_to sequoia_customers_url
  end
end
