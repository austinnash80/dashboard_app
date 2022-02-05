class AddIndexToEmpireMasterCaMatch < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_master_ca_matches, :lid, unique: true
  end
end
