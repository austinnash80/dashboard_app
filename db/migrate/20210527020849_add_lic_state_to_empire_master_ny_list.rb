class AddLicStateToEmpireMasterNyList < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_master_ny_lists, :lic_state, :string
  end
end
