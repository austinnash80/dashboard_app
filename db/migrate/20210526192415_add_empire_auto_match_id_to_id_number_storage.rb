class AddEmpireAutoMatchIdToIdNumberStorage < ActiveRecord::Migration[6.1]
  def change
    add_column :id_number_storages, :empire_auto_match_id, :integer
  end
end
