class CreateSequoiaMemberExps < ActiveRecord::Migration[6.1]
  def change
    create_table :sequoia_member_exps do |t|
      t.integer :uid
      t.string :membership
      t.date :last_membership
      t.date :membership_exp

      t.timestamps
    end
  end
end
