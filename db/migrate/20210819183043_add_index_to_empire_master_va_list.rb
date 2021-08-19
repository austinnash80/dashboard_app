class AddIndexToEmpireMasterVaList < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_master_va_lists, :lid, unique: true
  end
end
