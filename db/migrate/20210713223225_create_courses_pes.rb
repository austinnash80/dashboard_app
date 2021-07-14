class CreateCoursesPes < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_pes do |t|
      t.integer :number
      t.string :version
      t.string :title
      t.string :category
      t.string :sub_category
      t.integer :hours
      t.date :pub_date
      t.boolean :update
      t.boolean :new
      t.text :notes

      t.timestamps
    end
  end
end
