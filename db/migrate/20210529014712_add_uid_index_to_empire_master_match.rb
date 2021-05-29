class AddUidIndexToEmpireMasterMatch < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_master_matches, :uid, :unique => false
  end
end
