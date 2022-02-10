class RemoveIndexOnEmpireMasterCaMatch < ActiveRecord::Migration[6.1]
  def change
    remove_index "empire_master_ca_matches", column: [:lid], name: "index_empire_master_ca_matches_on_lid"
  end
end
