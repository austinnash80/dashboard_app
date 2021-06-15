class AddIndexToMasterEa < ActiveRecord::Migration[6.1]
  def change
    add_index :master_eas, :lid, unique: true
  end
end
