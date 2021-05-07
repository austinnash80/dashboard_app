class AddExistingToSequoiaCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_customers, :existing, :string
  end
end
