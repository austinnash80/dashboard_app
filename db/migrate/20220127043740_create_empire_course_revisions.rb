class CreateEmpireCourseRevisions < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_course_revisions do |t|
      t.integer :priority
      t.integer :course_number
      t.string :course
      t.string :course_type
      t.string :state
      t.string :status
      t.integer :hour
      t.string :revision
      t.text :note
      t.text :upgrades

      t.timestamps
    end
  end
end
