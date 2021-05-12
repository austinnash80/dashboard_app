class AddFieldsToIdNumberStorage < ActiveRecord::Migration[6.1]
  def change
    add_column :id_number_storages, :daily_sales_id, :integer
    add_column :id_number_storages, :daily_sales_sequoia_customer_order_id, :integer
  end
end
