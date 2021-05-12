require "test_helper"

class DailySalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_sale = daily_sales(:one)
  end

  test "should get index" do
    get daily_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_sale_url
    assert_response :success
  end

  test "should create daily_sale" do
    assert_difference('DailySale.count') do
      post daily_sales_url, params: { daily_sale: { afsp: @daily_sale.afsp, cpa_full_price: @daily_sale.cpa_full_price, cpa_renewal_price: @daily_sale.cpa_renewal_price, day: @daily_sale.day, day_of_week: @daily_sale.day_of_week, ea_full_price: @daily_sale.ea_full_price, ea_renewal_price: @daily_sale.ea_renewal_price, ethics: @daily_sale.ethics, month: @daily_sale.month, other: @daily_sale.other, sales: @daily_sale.sales, year: @daily_sale.year } }
    end

    assert_redirected_to daily_sale_url(DailySale.last)
  end

  test "should show daily_sale" do
    get daily_sale_url(@daily_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_sale_url(@daily_sale)
    assert_response :success
  end

  test "should update daily_sale" do
    patch daily_sale_url(@daily_sale), params: { daily_sale: { afsp: @daily_sale.afsp, cpa_full_price: @daily_sale.cpa_full_price, cpa_renewal_price: @daily_sale.cpa_renewal_price, day: @daily_sale.day, day_of_week: @daily_sale.day_of_week, ea_full_price: @daily_sale.ea_full_price, ea_renewal_price: @daily_sale.ea_renewal_price, ethics: @daily_sale.ethics, month: @daily_sale.month, other: @daily_sale.other, sales: @daily_sale.sales, year: @daily_sale.year } }
    assert_redirected_to daily_sale_url(@daily_sale)
  end

  test "should destroy daily_sale" do
    assert_difference('DailySale.count', -1) do
      delete daily_sale_url(@daily_sale)
    end

    assert_redirected_to daily_sales_url
  end
end
