class AddLnameToEmpireMasterMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_master_matches, :lname, :string
  end
end
