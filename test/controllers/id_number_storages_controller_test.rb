require "test_helper"

class IdNumberStoragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @id_number_storage = id_number_storages(:one)
  end

  test "should get index" do
    get id_number_storages_url
    assert_response :success
  end

  test "should get new" do
    get new_id_number_storage_url
    assert_response :success
  end

  test "should create id_number_storage" do
    assert_difference('IdNumberStorage.count') do
      post id_number_storages_url, params: { id_number_storage: { sequoia_members_order_id: @id_number_storage.sequoia_members_order_id } }
    end

    assert_redirected_to id_number_storage_url(IdNumberStorage.last)
  end

  test "should show id_number_storage" do
    get id_number_storage_url(@id_number_storage)
    assert_response :success
  end

  test "should get edit" do
    get edit_id_number_storage_url(@id_number_storage)
    assert_response :success
  end

  test "should update id_number_storage" do
    patch id_number_storage_url(@id_number_storage), params: { id_number_storage: { sequoia_members_order_id: @id_number_storage.sequoia_members_order_id } }
    assert_redirected_to id_number_storage_url(@id_number_storage)
  end

  test "should destroy id_number_storage" do
    assert_difference('IdNumberStorage.count', -1) do
      delete id_number_storage_url(@id_number_storage)
    end

    assert_redirected_to id_number_storages_url
  end
end
