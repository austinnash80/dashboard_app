require "application_system_test_case"

class DailySalesEmpiresTest < ApplicationSystemTestCase
  setup do
    @daily_sales_empire = daily_sales_empires(:one)
  end

  test "visiting the index" do
    visit daily_sales_empires_url
    assert_selector "h1", text: "Daily Sales Empires"
  end

  test "creating a Daily sales empire" do
    visit daily_sales_empires_url
    click_on "New Daily Sales Empire"

    fill_in "Day", with: @daily_sales_empire.day
    fill_in "Day of week", with: @daily_sales_empire.day_of_week
    fill_in "Month", with: @daily_sales_empire.month
    fill_in "Orders", with: @daily_sales_empire.orders
    fill_in "Sales", with: @daily_sales_empire.sales
    fill_in "Year", with: @daily_sales_empire.year
    click_on "Create Daily sales empire"

    assert_text "Daily sales empire was successfully created"
    click_on "Back"
  end

  test "updating a Daily sales empire" do
    visit daily_sales_empires_url
    click_on "Edit", match: :first

    fill_in "Day", with: @daily_sales_empire.day
    fill_in "Day of week", with: @daily_sales_empire.day_of_week
    fill_in "Month", with: @daily_sales_empire.month
    fill_in "Orders", with: @daily_sales_empire.orders
    fill_in "Sales", with: @daily_sales_empire.sales
    fill_in "Year", with: @daily_sales_empire.year
    click_on "Update Daily sales empire"

    assert_text "Daily sales empire was successfully updated"
    click_on "Back"
  end

  test "destroying a Daily sales empire" do
    visit daily_sales_empires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily sales empire was successfully destroyed"
  end
end
