class AddIndexToSequoiaCustomers < ActiveRecord::Migration[6.1]
  def change
    add_index :sequoia_customers, :order_id, unique: true
  end
end
