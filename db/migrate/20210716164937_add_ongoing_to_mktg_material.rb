class AddOngoingToMktgMaterial < ActiveRecord::Migration[6.1]
  def change
    add_column :mktg_materials, :ongoing, :boolean
  end
end
