class AddNoteToMasterEaNoMail < ActiveRecord::Migration[6.1]
  def change
    add_column :master_ea_no_mails, :note, :text
  end
end
