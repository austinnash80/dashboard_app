class CreateEmpireMasterMoMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_master_mo_matches do |t|
      t.string :st
      t.integer :lid
      t.string :list
      t.date :exp
      t.string :lic
      t.integer :uid
      t.string :lname
      t.date :search_date

      t.timestamps
    end
  end
end
