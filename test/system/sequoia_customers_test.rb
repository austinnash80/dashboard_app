require "application_system_test_case"

class SequoiaCustomersTest < ApplicationSystemTestCase
  setup do
    @sequoia_customer = sequoia_customers(:one)
  end

  test "visiting the index" do
    visit sequoia_customers_url
    assert_selector "h1", text: "Sequoia Customers"
  end

  test "creating a Sequoia customer" do
    visit sequoia_customers_url
    click_on "New Sequoia Customer"

    fill_in "City", with: @sequoia_customer.city
    fill_in "Designation", with: @sequoia_customer.designation
    fill_in "Email", with: @sequoia_customer.email
    fill_in "Exisiting", with: @sequoia_customer.exisiting
    fill_in "Fname", with: @sequoia_customer.fname
    fill_in "Lic num", with: @sequoia_customer.lic_num
    fill_in "Lic state", with: @sequoia_customer.lic_state
    fill_in "Lname", with: @sequoia_customer.lname
    fill_in "Order", with: @sequoia_customer.order_id
    fill_in "Price", with: @sequoia_customer.price
    fill_in "Price s", with: @sequoia_customer.price_s
    fill_in "Product 1", with: @sequoia_customer.product_1
    fill_in "Product 2", with: @sequoia_customer.product_2
    fill_in "Purchase", with: @sequoia_customer.purchase
    fill_in "Purchase s", with: @sequoia_customer.purchase_s
    fill_in "S", with: @sequoia_customer.s_id
    fill_in "State", with: @sequoia_customer.state
    fill_in "Street 1", with: @sequoia_customer.street_1
    fill_in "Street 2", with: @sequoia_customer.street_2
    fill_in "Uid", with: @sequoia_customer.uid
    fill_in "Zip", with: @sequoia_customer.zip
    click_on "Create Sequoia customer"

    assert_text "Sequoia customer was successfully created"
    click_on "Back"
  end

  test "updating a Sequoia customer" do
    visit sequoia_customers_url
    click_on "Edit", match: :first

    fill_in "City", with: @sequoia_customer.city
    fill_in "Designation", with: @sequoia_customer.designation
    fill_in "Email", with: @sequoia_customer.email
    fill_in "Exisiting", with: @sequoia_customer.exisiting
    fill_in "Fname", with: @sequoia_customer.fname
    fill_in "Lic num", with: @sequoia_customer.lic_num
    fill_in "Lic state", with: @sequoia_customer.lic_state
    fill_in "Lname", with: @sequoia_customer.lname
    fill_in "Order", with: @sequoia_customer.order_id
    fill_in "Price", with: @sequoia_customer.price
    fill_in "Price s", with: @sequoia_customer.price_s
    fill_in "Product 1", with: @sequoia_customer.product_1
    fill_in "Product 2", with: @sequoia_customer.product_2
    fill_in "Purchase", with: @sequoia_customer.purchase
    fill_in "Purchase s", with: @sequoia_customer.purchase_s
    fill_in "S", with: @sequoia_customer.s_id
    fill_in "State", with: @sequoia_customer.state
    fill_in "Street 1", with: @sequoia_customer.street_1
    fill_in "Street 2", with: @sequoia_customer.street_2
    fill_in "Uid", with: @sequoia_customer.uid
    fill_in "Zip", with: @sequoia_customer.zip
    click_on "Update Sequoia customer"

    assert_text "Sequoia customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Sequoia customer" do
    visit sequoia_customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sequoia customer was successfully destroyed"
  end
end
