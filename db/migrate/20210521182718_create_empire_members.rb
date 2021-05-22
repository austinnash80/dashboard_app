class CreateEmpireMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_members do |t|
      t.integer :uid
      t.string :lname
      t.date :first_purchase
      t.date :last_purchase
      t.string :state
      t.integer :purchases

      t.timestamps
    end
  end
end
