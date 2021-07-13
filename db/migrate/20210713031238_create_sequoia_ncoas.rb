class CreateSequoiaNcoas < ActiveRecord::Migration[6.1]
  def change
    create_table :sequoia_ncoas do |t|
      t.integer :uid
      t.string :ncoa_list
      t.string :stree_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :good
      t.boolean :bad

      t.timestamps
    end
  end
end
