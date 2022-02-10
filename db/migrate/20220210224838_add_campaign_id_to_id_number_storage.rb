class AddCampaignIdToIdNumberStorage < ActiveRecord::Migration[6.1]
  def change
    add_column :id_number_storages, :campaign_id, :integer
  end
end
