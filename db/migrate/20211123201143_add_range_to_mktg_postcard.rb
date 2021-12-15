class AddRangeToMktgPostcard < ActiveRecord::Migration[6.1]
  def change
    add_column :mktg_postcards, :range_4_a, :date
    add_column :mktg_postcards, :range_4_b, :date
    add_column :mktg_postcards, :range_5_a, :date
    add_column :mktg_postcards, :range_5_b, :date
    add_column :mktg_postcards, :range_6_a, :date
    add_column :mktg_postcards, :range_6_b, :date
    add_column :mktg_postcards, :range_7_a, :date
    add_column :mktg_postcards, :range_7_b, :date
    add_column :mktg_postcards, :range_8_a, :date
    add_column :mktg_postcards, :range_8_b, :date
    add_column :mktg_postcards, :range_9_a, :date
    add_column :mktg_postcards, :range_9_b, :date
    add_column :mktg_postcards, :range_10_a, :date
    add_column :mktg_postcards, :range_10_b, :date
  end
end
