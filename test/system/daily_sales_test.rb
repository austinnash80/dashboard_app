require "application_system_test_case"

class DailySalesTest < ApplicationSystemTestCase
  setup do
    @daily_sale = daily_sales(:one)
  end

  test "visiting the index" do
    visit daily_sales_url
    assert_selector "h1", text: "Daily Sales"
  end

  test "creating a Daily sale" do
    visit daily_sales_url
    click_on "New Daily Sale"

    fill_in "Afsp", with: @daily_sale.afsp
    fill_in "Cpa full price", with: @daily_sale.cpa_full_price
    fill_in "Cpa renewal price", with: @daily_sale.cpa_renewal_price
    fill_in "Day", with: @daily_sale.day
    fill_in "Day of week", with: @daily_sale.day_of_week
    fill_in "Ea full price", with: @daily_sale.ea_full_price
    fill_in "Ea renewal price", with: @daily_sale.ea_renewal_price
    fill_in "Ethics", with: @daily_sale.ethics
    fill_in "Month", with: @daily_sale.month
    fill_in "Other", with: @daily_sale.other
    fill_in "Sales", with: @daily_sale.sales
    fill_in "Year", with: @daily_sale.year
    click_on "Create Daily sale"

    assert_text "Daily sale was successfully created"
    click_on "Back"
  end

  test "updating a Daily sale" do
    visit daily_sales_url
    click_on "Edit", match: :first

    fill_in "Afsp", with: @daily_sale.afsp
    fill_in "Cpa full price", with: @daily_sale.cpa_full_price
    fill_in "Cpa renewal price", with: @daily_sale.cpa_renewal_price
    fill_in "Day", with: @daily_sale.day
    fill_in "Day of week", with: @daily_sale.day_of_week
    fill_in "Ea full price", with: @daily_sale.ea_full_price
    fill_in "Ea renewal price", with: @daily_sale.ea_renewal_price
    fill_in "Ethics", with: @daily_sale.ethics
    fill_in "Month", with: @daily_sale.month
    fill_in "Other", with: @daily_sale.other
    fill_in "Sales", with: @daily_sale.sales
    fill_in "Year", with: @daily_sale.year
    click_on "Update Daily sale"

    assert_text "Daily sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Daily sale" do
    visit daily_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily sale was successfully destroyed"
  end
end
