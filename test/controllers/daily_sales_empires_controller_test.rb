require "test_helper"

class DailySalesEmpiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_sales_empire = daily_sales_empires(:one)
  end

  test "should get index" do
    get daily_sales_empires_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_sales_empire_url
    assert_response :success
  end

  test "should create daily_sales_empire" do
    assert_difference('DailySalesEmpire.count') do
      post daily_sales_empires_url, params: { daily_sales_empire: { day: @daily_sales_empire.day, day_of_week: @daily_sales_empire.day_of_week, month: @daily_sales_empire.month, orders: @daily_sales_empire.orders, sales: @daily_sales_empire.sales, year: @daily_sales_empire.year } }
    end

    assert_redirected_to daily_sales_empire_url(DailySalesEmpire.last)
  end

  test "should show daily_sales_empire" do
    get daily_sales_empire_url(@daily_sales_empire)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_sales_empire_url(@daily_sales_empire)
    assert_response :success
  end

  test "should update daily_sales_empire" do
    patch daily_sales_empire_url(@daily_sales_empire), params: { daily_sales_empire: { day: @daily_sales_empire.day, day_of_week: @daily_sales_empire.day_of_week, month: @daily_sales_empire.month, orders: @daily_sales_empire.orders, sales: @daily_sales_empire.sales, year: @daily_sales_empire.year } }
    assert_redirected_to daily_sales_empire_url(@daily_sales_empire)
  end

  test "should destroy daily_sales_empire" do
    assert_difference('DailySalesEmpire.count', -1) do
      delete daily_sales_empire_url(@daily_sales_empire)
    end

    assert_redirected_to daily_sales_empires_url
  end
end
