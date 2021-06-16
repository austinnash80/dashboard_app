class AddIndexToEmpireCustomer < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_customers, :e_id, unique: true
  end
end
