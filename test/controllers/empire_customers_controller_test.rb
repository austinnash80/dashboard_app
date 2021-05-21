require "test_helper"

class EmpireCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empire_customer = empire_customers(:one)
  end

  test "should get index" do
    get empire_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_empire_customer_url
    assert_response :success
  end

  test "should create empire_customer" do
    assert_difference('EmpireCustomer.count') do
      post empire_customers_url, params: { empire_customer: { city: @empire_customer.city, e_id: @empire_customer.e_id, email: @empire_customer.email, existing: @empire_customer.existing, fname: @empire_customer.fname, lic_num: @empire_customer.lic_num, lic_state: @empire_customer.lic_state, lname: @empire_customer.lname, price: @empire_customer.price, price_s: @empire_customer.price_s, product: @empire_customer.product, purchase: @empire_customer.purchase, purchase_s: @empire_customer.purchase_s, state: @empire_customer.state, street_1: @empire_customer.street_1, street_2: @empire_customer.street_2, uid: @empire_customer.uid, zip: @empire_customer.zip } }
    end

    assert_redirected_to empire_customer_url(EmpireCustomer.last)
  end

  test "should show empire_customer" do
    get empire_customer_url(@empire_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_empire_customer_url(@empire_customer)
    assert_response :success
  end

  test "should update empire_customer" do
    patch empire_customer_url(@empire_customer), params: { empire_customer: { city: @empire_customer.city, e_id: @empire_customer.e_id, email: @empire_customer.email, existing: @empire_customer.existing, fname: @empire_customer.fname, lic_num: @empire_customer.lic_num, lic_state: @empire_customer.lic_state, lname: @empire_customer.lname, price: @empire_customer.price, price_s: @empire_customer.price_s, product: @empire_customer.product, purchase: @empire_customer.purchase, purchase_s: @empire_customer.purchase_s, state: @empire_customer.state, street_1: @empire_customer.street_1, street_2: @empire_customer.street_2, uid: @empire_customer.uid, zip: @empire_customer.zip } }
    assert_redirected_to empire_customer_url(@empire_customer)
  end

  test "should destroy empire_customer" do
    assert_difference('EmpireCustomer.count', -1) do
      delete empire_customer_url(@empire_customer)
    end

    assert_redirected_to empire_customers_url
  end
end
