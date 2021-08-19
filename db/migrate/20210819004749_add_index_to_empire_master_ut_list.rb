class AddIndexToEmpireMasterUtList < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_master_ut_lists, :lid, unique: true
  end
end
