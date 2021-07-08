class AddFieldsToSequoiaProductList < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_product_lists, :new, :boolean
    add_column :sequoia_product_lists, :reterning, :boolean
  end
end
