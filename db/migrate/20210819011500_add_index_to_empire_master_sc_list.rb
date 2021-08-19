class AddIndexToEmpireMasterScList < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_master_sc_lists, :lid, unique: true
  end
end
