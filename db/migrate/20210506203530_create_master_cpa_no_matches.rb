class CreateMasterCpaNoMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :master_cpa_no_matches do |t|
      t.integer :uid
      t.string :list
      t.string :lname
      t.date :search_date

      t.timestamps
    end
  end
end
