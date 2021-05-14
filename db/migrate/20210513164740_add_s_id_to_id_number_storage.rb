class AddSIdToIdNumberStorage < ActiveRecord::Migration[6.1]
  def change
    add_column :id_number_storages, :sequoia_customer_s_id, :string
    add_column :id_number_storages, :integer, :string
  end
end
