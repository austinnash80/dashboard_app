class AddFieldToIdNumberStorage < ActiveRecord::Migration[6.1]
  def change
    add_column :id_number_storages, :sequoia_member_exps_order_id, :integer
  end
end
