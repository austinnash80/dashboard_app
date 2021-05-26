class CreateEmpireMasterNoMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_master_no_matches do |t|
      t.integer :lid
      t.string :list
      t.string :lic_st
      t.date :search_date

      t.timestamps
    end
  end
end
