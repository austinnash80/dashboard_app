class CreateSequoiaProductLists < ActiveRecord::Migration[6.1]
  def change
    create_table :sequoia_product_lists do |t|
      t.string :product
      t.string :who
      t.string :type

      t.timestamps
    end
  end
end
