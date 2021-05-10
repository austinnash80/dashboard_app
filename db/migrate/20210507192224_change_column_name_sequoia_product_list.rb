class ChangeColumnNameSequoiaProductList < ActiveRecord::Migration[6.1]
  def change
    rename_column :sequoia_product_lists, :type, :group
  end
end
