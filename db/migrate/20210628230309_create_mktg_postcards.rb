class CreateMktgPostcards < ActiveRecord::Migration[6.1]
  def change
    create_table :mktg_postcards do |t|
      t.string :campaign
      t.string :company
      t.date :mail_day
      t.date :range_1_a
      t.date :range_1_b
      t.date :range_2_a
      t.date :range_2_b
      t.boolean :done
      t.integer :cpa_sent
      t.integer :ea_sent
      t.text :notes

      t.timestamps
    end
  end
end
