class AddTextRangeToMktgPostcard < ActiveRecord::Migration[6.1]
  def change
    add_column :mktg_postcards, :range_11_a, :date
    add_column :mktg_postcards, :range_11_b, :date
  end
end
