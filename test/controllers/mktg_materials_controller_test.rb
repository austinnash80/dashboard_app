require "test_helper"

class MktgMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mktg_material = mktg_materials(:one)
  end

  test "should get index" do
    get mktg_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_mktg_material_url
    assert_response :success
  end

  test "should create mktg_material" do
    assert_difference('MktgMaterial.count') do
      post mktg_materials_url, params: { mktg_material: { campaign: @mktg_material.campaign, co: @mktg_material.co, delivered_to: @mktg_material.delivered_to, land_date: @mktg_material.land_date, link_name: @mktg_material.link_name, name: @mktg_material.name, quantity: @mktg_material.quantity } }
    end

    assert_redirected_to mktg_material_url(MktgMaterial.last)
  end

  test "should show mktg_material" do
    get mktg_material_url(@mktg_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_mktg_material_url(@mktg_material)
    assert_response :success
  end

  test "should update mktg_material" do
    patch mktg_material_url(@mktg_material), params: { mktg_material: { campaign: @mktg_material.campaign, co: @mktg_material.co, delivered_to: @mktg_material.delivered_to, land_date: @mktg_material.land_date, link_name: @mktg_material.link_name, name: @mktg_material.name, quantity: @mktg_material.quantity } }
    assert_redirected_to mktg_material_url(@mktg_material)
  end

  test "should destroy mktg_material" do
    assert_difference('MktgMaterial.count', -1) do
      delete mktg_material_url(@mktg_material)
    end

    assert_redirected_to mktg_materials_url
  end
end
