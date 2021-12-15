class CreateEmpireStateTasksSuppliments < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_state_tasks_suppliments do |t|
      t.integer :step_number
      t.string :step_name

      t.timestamps
    end
  end
end
