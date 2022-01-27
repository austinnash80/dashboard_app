class CreateEmpireCourseRevisionSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_course_revision_steps do |t|
      t.integer :number
      t.string :phase
      t.string :step
      t.string :details
      t.string :assigned
      t.text :note
      t.date :due_date
      t.boolean :complete
      t.date :complete_date
      t.string :file
      t.integer :empire_course_revision_id
      t.string :extra_s
      t.integer :extra_i

      t.timestamps
    end
  end
end
