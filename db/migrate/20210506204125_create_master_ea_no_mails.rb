class CreateMasterEaNoMails < ActiveRecord::Migration[6.1]
  def change
    create_table :master_ea_no_mails do |t|
      t.integer :lid
      t.string :list
      t.string :lname
      t.date :search_date

      t.timestamps
    end
  end
end
