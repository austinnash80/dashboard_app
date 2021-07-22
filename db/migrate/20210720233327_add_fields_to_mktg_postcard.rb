class AddFieldsToMktgPostcard < ActiveRecord::Migration[6.1]
  def change
    add_column :mktg_postcards, :drop_day, :date
    add_column :mktg_postcards, :land_day, :date
  end
end
