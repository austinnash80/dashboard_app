class AddProofFieldToCoursesSequoium < ActiveRecord::Migration[6.1]
  def change
    add_column :courses_sequoia, :proof, :boolean
  end
end
