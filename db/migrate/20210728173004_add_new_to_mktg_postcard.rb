class AddNewToMktgPostcard < ActiveRecord::Migration[6.1]
  def change
    add_column :mktg_postcards, :campaign_id, :integer
    add_column :mktg_postcards, :delivery_type, :string
    add_column :mktg_postcards, :range_3_a, :date
    add_column :mktg_postcards, :range_3_b, :date
  end
end
