class CreateEmpireMasterMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_master_matches do |t|
      t.integer :lid
      t.string :list
      t.string :lic_st
      t.integer :uid
      t.date :search_date

      t.timestamps
    end
  end
end
