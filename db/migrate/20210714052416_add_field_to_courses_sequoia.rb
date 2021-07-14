class AddFieldToCoursesSequoia < ActiveRecord::Migration[6.1]
  def change
    add_column :courses_sequoia, :version_update, :boolean
    add_column :courses_sequoia, :new, :boolean
  end
end
