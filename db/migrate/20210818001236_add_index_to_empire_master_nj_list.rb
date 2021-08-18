class AddIndexToEmpireMasterNjList < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_master_nj_lists, :lid, unique: true
  end
end
