class RemoveLidIndexToEmpireMasterMatch < ActiveRecord::Migration[6.1]
  def change
    remove_index :empire_master_matches, :lid
  end
end
