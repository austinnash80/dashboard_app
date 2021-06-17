class CreateNoMailNotFounds < ActiveRecord::Migration[6.1]
  def change
    create_table :no_mail_not_founds do |t|
      t.string :company
      t.string :fname
      t.string :mi
      t.string :lname
      t.string :suf
      t.string :co
      t.string :add
      t.string :add2
      t.string :city
      t.string :state
      t.string :zip
      t.string :note
      t.string :des
      t.string :lic_state

      t.timestamps
    end
  end
end
