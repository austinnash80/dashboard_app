class ChangeUpdateCoursesPe < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses_pes, :update, :version_update
  end
end
