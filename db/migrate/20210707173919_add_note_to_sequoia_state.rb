class AddNoteToSequoiaState < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_states, :note, :text
  end
end
