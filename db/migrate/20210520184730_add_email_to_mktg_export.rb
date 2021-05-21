class AddEmailToMktgExport < ActiveRecord::Migration[6.1]
  def change
    add_column :mktg_exports, :email, :string
  end
end
