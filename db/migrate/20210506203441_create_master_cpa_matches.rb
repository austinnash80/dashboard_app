class CreateMasterCpaMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :master_cpa_matches do |t|
      t.integer :lid
      t.string :list
      t.integer :uid
      t.string :lname
      t.date :search_date

      t.timestamps
    end
  end
end
