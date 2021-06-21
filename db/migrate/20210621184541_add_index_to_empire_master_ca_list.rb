class AddIndexToEmpireMasterCaList < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_master_ca_lists, :lid, unique: true
  end
end
