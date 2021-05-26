class CreateEmpireMasterDoubleAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :empire_master_double_accounts do |t|
      t.integer :uid
      t.string :lic_st
      t.string :list
      t.string :lname
      t.date :search_date

      t.timestamps
    end
  end
end
