class CreateMktgMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :mktg_materials do |t|
      t.string :co
      t.string :campaign
      t.string :name
      t.date :land_date
      t.string :delivered_to
      t.integer :quantity
      t.string :link_name

      t.timestamps
    end
  end
end
