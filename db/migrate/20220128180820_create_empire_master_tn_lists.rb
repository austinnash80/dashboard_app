class CreateEmpireMasterTnLists < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_master_tn_lists do |t|
      t.integer :lid
      t.string :list
      t.string :lic_state
      t.string :lic
      t.string :record_type
      t.string :lic_status
      t.string :iss_date_s
      t.date :iss_date
      t.string :exp_date_s
      t.date :exp_date
      t.string :fname
      t.string :mi
      t.string :lname
      t.string :suf
      t.string :co
      t.string :add
      t.string :adds
      t.string :city
      t.string :st
      t.string :zip
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
