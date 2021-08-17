class CreateEmpireStates < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_states do |t|
      t.string :state
      t.string :st
      t.integer :customers
      t.integer :matched_customers
      t.integer :list_size
      t.date :list_date
      t.string :list_cost
      t.text :list_notes
      t.string :exp_type
      t.string :renewal_cycle
      t.date :next_exp
      t.text :exp_notes

      t.timestamps
    end
  end
end
