class AddFieldToMktgPostcard < ActiveRecord::Migration[6.1]
  def change
    add_column :mktg_postcards, :segment, :string
    add_column :mktg_postcards, :sent, :integer
  end
end
