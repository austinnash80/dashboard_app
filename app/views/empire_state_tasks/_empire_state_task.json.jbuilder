json.extract! empire_state_task, :id, :empire_state_id, :step_number, :step_name, :details, :assigned, :due_date, :completed, :completed_date, :task_notes, :created_at, :updated_at
json.url empire_state_task_url(empire_state_task, format: :json)
