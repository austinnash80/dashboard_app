class AddFieldsToEmpireMasterCaMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_master_ca_matches, :uid2, :integer
    add_column :empire_master_ca_matches, :uid3, :integer
    add_column :empire_master_ca_matches, :notes, :text
  end
end
