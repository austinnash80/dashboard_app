class AddUpdateSheetToCoursesSequoia < ActiveRecord::Migration[6.1]
  def change
    add_column :courses_sequoia, :update_sheet, :boolean
  end
end
