class AddLicToEmpireMasterMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_master_matches, :lic, :string
  end
end
