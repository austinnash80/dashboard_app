class CreateMasterEas < ActiveRecord::Migration[6.1]
  def change
    create_table :master_eas do |t|
      t.integer :lid
      t.string :list
      t.string :lic
      t.string :fname
      t.string :mi
      t.string :lname
      t.string :suf
      t.string :co
      t.string :add
      t.string :add2
      t.string :city
      t.string :st
      t.string :zip

      t.timestamps
    end
  end
end
