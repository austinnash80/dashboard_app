class CreateSequoiaMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :sequoia_members do |t|
      t.integer :uid
      t.string :lname
      t.date :first_purchase
      t.date :last_purchase
      t.boolean :cpa
      t.integer :cpa_memberships
      t.boolean :ea
      t.integer :memberships
      t.boolean :afsp
      t.integer :afsp_purchases
      t.boolean :ethics
      t.integer :ethics_purchases

      t.timestamps
    end
  end
end
