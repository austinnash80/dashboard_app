require "application_system_test_case"

class EmpireCustomersTest < ApplicationSystemTestCase
  setup do
    @empire_customer = empire_customers(:one)
  end

  test "visiting the index" do
    visit empire_customers_url
    assert_selector "h1", text: "Empire Customers"
  end

  test "creating a Empire customer" do
    visit empire_customers_url
    click_on "New Empire Customer"

    fill_in "City", with: @empire_customer.city
    fill_in "E", with: @empire_customer.e_id
    fill_in "Email", with: @empire_customer.email
    fill_in "Existing", with: @empire_customer.existing
    fill_in "Fname", with: @empire_customer.fname
    fill_in "Lic num", with: @empire_customer.lic_num
    fill_in "Lic state", with: @empire_customer.lic_state
    fill_in "Lname", with: @empire_customer.lname
    fill_in "Price", with: @empire_customer.price
    fill_in "Price s", with: @empire_customer.price_s
    fill_in "Product", with: @empire_customer.product
    fill_in "Purchase", with: @empire_customer.purchase
    fill_in "Purchase s", with: @empire_customer.purchase_s
    fill_in "State", with: @empire_customer.state
    fill_in "Street 1", with: @empire_customer.street_1
    fill_in "Street 2", with: @empire_customer.street_2
    fill_in "Uid", with: @empire_customer.uid
    fill_in "Zip", with: @empire_customer.zip
    click_on "Create Empire customer"

    assert_text "Empire customer was successfully created"
    click_on "Back"
  end

  test "updating a Empire customer" do
    visit empire_customers_url
    click_on "Edit", match: :first

    fill_in "City", with: @empire_customer.city
    fill_in "E", with: @empire_customer.e_id
    fill_in "Email", with: @empire_customer.email
    fill_in "Existing", with: @empire_customer.existing
    fill_in "Fname", with: @empire_customer.fname
    fill_in "Lic num", with: @empire_customer.lic_num
    fill_in "Lic state", with: @empire_customer.lic_state
    fill_in "Lname", with: @empire_customer.lname
    fill_in "Price", with: @empire_customer.price
    fill_in "Price s", with: @empire_customer.price_s
    fill_in "Product", with: @empire_customer.product
    fill_in "Purchase", with: @empire_customer.purchase
    fill_in "Purchase s", with: @empire_customer.purchase_s
    fill_in "State", with: @empire_customer.state
    fill_in "Street 1", with: @empire_customer.street_1
    fill_in "Street 2", with: @empire_customer.street_2
    fill_in "Uid", with: @empire_customer.uid
    fill_in "Zip", with: @empire_customer.zip
    click_on "Update Empire customer"

    assert_text "Empire customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Empire customer" do
    visit empire_customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empire customer was successfully destroyed"
  end
end
