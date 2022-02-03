class CreateEmpireManualMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_manual_matches do |t|
      t.boolean :match
      t.integer :uid
      t.integer :lid
      t.string :list
      t.string :lic
      t.string :lname

      t.timestamps
    end
  end
end
