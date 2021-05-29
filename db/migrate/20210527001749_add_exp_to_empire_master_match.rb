class AddExpToEmpireMasterMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_master_matches, :exp, :date
  end
end
