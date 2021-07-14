require "test_helper"

class CoursesSequoiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courses_sequoium = courses_sequoia(:one)
  end

  test "should get index" do
    get courses_sequoia_url
    assert_response :success
  end

  test "should get new" do
    get new_courses_sequoium_url
    assert_response :success
  end

  test "should create courses_sequoium" do
    assert_difference('CoursesSequoium.count') do
      post courses_sequoia_url, params: { courses_sequoium: { active: @courses_sequoium.active, category: @courses_sequoium.category, exam: @courses_sequoium.exam, hours: @courses_sequoium.hours, notes: @courses_sequoium.notes, number: @courses_sequoium.number, pes_number: @courses_sequoium.pes_number, pes_version: @courses_sequoium.pes_version, pub_date: @courses_sequoium.pub_date, sub_category: @courses_sequoium.sub_category, text: @courses_sequoium.text, title: @courses_sequoium.title, version: @courses_sequoium.version } }
    end

    assert_redirected_to courses_sequoium_url(CoursesSequoium.last)
  end

  test "should show courses_sequoium" do
    get courses_sequoium_url(@courses_sequoium)
    assert_response :success
  end

  test "should get edit" do
    get edit_courses_sequoium_url(@courses_sequoium)
    assert_response :success
  end

  test "should update courses_sequoium" do
    patch courses_sequoium_url(@courses_sequoium), params: { courses_sequoium: { active: @courses_sequoium.active, category: @courses_sequoium.category, exam: @courses_sequoium.exam, hours: @courses_sequoium.hours, notes: @courses_sequoium.notes, number: @courses_sequoium.number, pes_number: @courses_sequoium.pes_number, pes_version: @courses_sequoium.pes_version, pub_date: @courses_sequoium.pub_date, sub_category: @courses_sequoium.sub_category, text: @courses_sequoium.text, title: @courses_sequoium.title, version: @courses_sequoium.version } }
    assert_redirected_to courses_sequoium_url(@courses_sequoium)
  end

  test "should destroy courses_sequoium" do
    assert_difference('CoursesSequoium.count', -1) do
      delete courses_sequoium_url(@courses_sequoium)
    end

    assert_redirected_to courses_sequoia_url
  end
end
