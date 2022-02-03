class AddLicFieldsToEmpireMember < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_members, :fname, :string
    add_column :empire_members, :lic_expired, :boolean
    add_column :empire_members, :lic_not_found, :boolean
    add_column :empire_members, :lic_edit, :boolean
    add_column :empire_members, :lic_notes, :text
  end
end
