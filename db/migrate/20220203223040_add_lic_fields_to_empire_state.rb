class AddLicFieldsToEmpireState < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_states, :lic_expired, :integer
    add_column :empire_states, :lic_other, :integer
  end
end
