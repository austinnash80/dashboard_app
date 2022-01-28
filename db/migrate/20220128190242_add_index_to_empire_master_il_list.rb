class AddIndexToEmpireMasterIlList < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_master_il_lists, :lid, unique: true
  end
end
