class AddLicNotInMasterFieldsToEmpireMember < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_members, :lic_not_in_master, :boolean
  end
end
