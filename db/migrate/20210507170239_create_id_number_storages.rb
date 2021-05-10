class CreateIdNumberStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :id_number_storages do |t|
      t.integer :sequoia_members_order_id

      t.timestamps
    end
  end
end
