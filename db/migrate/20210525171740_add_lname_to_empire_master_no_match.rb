class AddLnameToEmpireMasterNoMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_master_no_matches, :lname, :string
  end
end
