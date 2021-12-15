class CreateEmpireStateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_state_tasks do |t|
      t.integer :empire_state_id
      t.integer :step_number
      t.string :step_name
      t.text :details
      t.string :assigned
      t.date :due_date
      t.boolean :completed
      t.string :completed_date
      t.text :task_notes

      t.timestamps
    end
  end
end
