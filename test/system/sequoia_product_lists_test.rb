require "application_system_test_case"

class SequoiaProductListsTest < ApplicationSystemTestCase
  setup do
    @sequoia_product_list = sequoia_product_lists(:one)
  end

  test "visiting the index" do
    visit sequoia_product_lists_url
    assert_selector "h1", text: "Sequoia Product Lists"
  end

  test "creating a Sequoia product list" do
    visit sequoia_product_lists_url
    click_on "New Sequoia Product List"

    fill_in "Product", with: @sequoia_product_list.product
    fill_in "Type", with: @sequoia_product_list.type
    fill_in "Who", with: @sequoia_product_list.who
    click_on "Create Sequoia product list"

    assert_text "Sequoia product list was successfully created"
    click_on "Back"
  end

  test "updating a Sequoia product list" do
    visit sequoia_product_lists_url
    click_on "Edit", match: :first

    fill_in "Product", with: @sequoia_product_list.product
    fill_in "Type", with: @sequoia_product_list.type
    fill_in "Who", with: @sequoia_product_list.who
    click_on "Update Sequoia product list"

    assert_text "Sequoia product list was successfully updated"
    click_on "Back"
  end

  test "destroying a Sequoia product list" do
    visit sequoia_product_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sequoia product list was successfully destroyed"
  end
end
