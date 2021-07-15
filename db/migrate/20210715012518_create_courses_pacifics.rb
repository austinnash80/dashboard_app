class CreateCoursesPacifics < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_pacifics do |t|
      t.integer :number
      t.string :version
      t.string :title
      t.integer :hours
      t.string :category
      t.string :sub_category
      t.date :pub_date
      t.integer :sequoia_number
      t.string :sequoia_version
      t.boolean :text
      t.boolean :exam
      t.boolean :active
      t.boolean :new
      t.boolean :version_update
      t.boolean :update_sheet
      t.text :notes

      t.timestamps
    end
  end
end
