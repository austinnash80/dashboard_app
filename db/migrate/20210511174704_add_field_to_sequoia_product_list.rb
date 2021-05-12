class AddFieldToSequoiaProductList < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_product_lists, :full_price, :boolean
    add_column :sequoia_product_lists, :renewal_price, :boolean
  end
end
