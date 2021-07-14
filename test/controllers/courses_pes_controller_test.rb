require "test_helper"

class CoursesPesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courses_pe = courses_pes(:one)
  end

  test "should get index" do
    get courses_pes_url
    assert_response :success
  end

  test "should get new" do
    get new_courses_pe_url
    assert_response :success
  end

  test "should create courses_pe" do
    assert_difference('CoursesPe.count') do
      post courses_pes_url, params: { courses_pe: { category: @courses_pe.category, hours: @courses_pe.hours, new: @courses_pe.new, notes: @courses_pe.notes, number: @courses_pe.number, pub_date: @courses_pe.pub_date, sub_category: @courses_pe.sub_category, title: @courses_pe.title, update: @courses_pe.update, version: @courses_pe.version } }
    end

    assert_redirected_to courses_pe_url(CoursesPe.last)
  end

  test "should show courses_pe" do
    get courses_pe_url(@courses_pe)
    assert_response :success
  end

  test "should get edit" do
    get edit_courses_pe_url(@courses_pe)
    assert_response :success
  end

  test "should update courses_pe" do
    patch courses_pe_url(@courses_pe), params: { courses_pe: { category: @courses_pe.category, hours: @courses_pe.hours, new: @courses_pe.new, notes: @courses_pe.notes, number: @courses_pe.number, pub_date: @courses_pe.pub_date, sub_category: @courses_pe.sub_category, title: @courses_pe.title, update: @courses_pe.update, version: @courses_pe.version } }
    assert_redirected_to courses_pe_url(@courses_pe)
  end

  test "should destroy courses_pe" do
    assert_difference('CoursesPe.count', -1) do
      delete courses_pe_url(@courses_pe)
    end

    assert_redirected_to courses_pes_url
  end
end
