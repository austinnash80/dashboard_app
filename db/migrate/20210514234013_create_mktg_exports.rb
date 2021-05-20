class CreateMktgExports < ActiveRecord::Migration[6.1]
  def change
    create_table :mktg_exports do |t|
      t.integer :uid
      t.string :campaign
      t.string :des
      t.date :exp
      t.string :fname
      t.string :lname
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :text_1
      t.string :text_2
      t.string :text_3
      t.string :text_4
      t.string :text_5
      t.string :text_6
      t.string :text_7
      t.string :text_8
      t.string :text_9
      t.string :text_10

      t.timestamps
    end
  end
end
