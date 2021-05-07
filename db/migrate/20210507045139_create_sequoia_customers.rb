class CreateSequoiaCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :sequoia_customers do |t|
      t.integer :s_id
      t.integer :order_id
      t.integer :uid
      t.string :lic_state
      t.string :lic_num
      t.string :exisiting
      t.string :purchase_s
      t.date :purchase
      t.string :price_s
      t.integer :price
      t.string :product_1
      t.string :product_2
      t.string :designation
      t.string :email
      t.string :fname
      t.string :lname
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
