class CreateCoursesSequoia < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_sequoia do |t|
      t.integer :number
      t.string :version
      t.string :title
      t.string :category
      t.string :sub_category
      t.integer :hours
      t.date :pub_date
      t.integer :pes_number
      t.string :pes_version
      t.boolean :text
      t.boolean :exam
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
