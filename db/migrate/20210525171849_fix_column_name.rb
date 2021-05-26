class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :empire_master_no_matches, :lid, :uid
  end
end
