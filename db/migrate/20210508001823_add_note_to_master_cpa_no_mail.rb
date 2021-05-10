class AddNoteToMasterCpaNoMail < ActiveRecord::Migration[6.1]
  def change
    add_column :master_cpa_no_mails, :note, :text
  end
end
