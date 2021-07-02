class CreateSequoiaStates < ActiveRecord::Migration[6.1]
  def change
    create_table :sequoia_states do |t|
      t.string :state
      t.string :st
      t.string :list
      t.integer :list_quantity
      t.integer :matched
      t.decimal :market_share
      t.string :ce_cycle
      t.integer :hours_per_cycle
      t.string :ce_due
      t.string :exp_date
      t.string :exp_cycle
      t.string :self_study
      t.boolean :has_year_minimum
      t.integer :year_minimum

      t.timestamps
    end
  end
end
