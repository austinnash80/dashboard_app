class AddEmpireDailySalesIdToIdNumberStorage < ActiveRecord::Migration[6.1]
  def change
    add_column :id_number_storages, :empire_daily_sales_id, :integer
  end
end
