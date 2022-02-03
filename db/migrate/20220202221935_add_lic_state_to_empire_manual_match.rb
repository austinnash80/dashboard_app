class AddLicStateToEmpireManualMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_manual_matches, :lic_state, :string
  end
end
