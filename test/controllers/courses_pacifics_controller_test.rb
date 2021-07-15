require "test_helper"

class CoursesPacificsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courses_pacific = courses_pacifics(:one)
  end

  test "should get index" do
    get courses_pacifics_url
    assert_response :success
  end

  test "should get new" do
    get new_courses_pacific_url
    assert_response :success
  end

  test "should create courses_pacific" do
    assert_difference('CoursesPacific.count') do
      post courses_pacifics_url, params: { courses_pacific: { active: @courses_pacific.active, category: @courses_pacific.category, exam: @courses_pacific.exam, hours: @courses_pacific.hours, new: @courses_pacific.new, notes: @courses_pacific.notes, number: @courses_pacific.number, pub_date: @courses_pacific.pub_date, sequoia_number: @courses_pacific.sequoia_number, sequoia_version: @courses_pacific.sequoia_version, sub_category: @courses_pacific.sub_category, text: @courses_pacific.text, title: @courses_pacific.title, update_sheet: @courses_pacific.update_sheet, version: @courses_pacific.version, version_update: @courses_pacific.version_update } }
    end

    assert_redirected_to courses_pacific_url(CoursesPacific.last)
  end

  test "should show courses_pacific" do
    get courses_pacific_url(@courses_pacific)
    assert_response :success
  end

  test "should get edit" do
    get edit_courses_pacific_url(@courses_pacific)
    assert_response :success
  end

  test "should update courses_pacific" do
    patch courses_pacific_url(@courses_pacific), params: { courses_pacific: { active: @courses_pacific.active, category: @courses_pacific.category, exam: @courses_pacific.exam, hours: @courses_pacific.hours, new: @courses_pacific.new, notes: @courses_pacific.notes, number: @courses_pacific.number, pub_date: @courses_pacific.pub_date, sequoia_number: @courses_pacific.sequoia_number, sequoia_version: @courses_pacific.sequoia_version, sub_category: @courses_pacific.sub_category, text: @courses_pacific.text, title: @courses_pacific.title, update_sheet: @courses_pacific.update_sheet, version: @courses_pacific.version, version_update: @courses_pacific.version_update } }
    assert_redirected_to courses_pacific_url(@courses_pacific)
  end

  test "should destroy courses_pacific" do
    assert_difference('CoursesPacific.count', -1) do
      delete courses_pacific_url(@courses_pacific)
    end

    assert_redirected_to courses_pacifics_url
  end
end
