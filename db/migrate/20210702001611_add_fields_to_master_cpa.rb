class AddFieldsToMasterCpa < ActiveRecord::Migration[6.1]
  def change
    add_column :master_cpas, :exp_s, :string
    add_column :master_cpas, :exp, :date
    add_column :master_cpas, :iss_s, :string
    add_column :master_cpas, :iss, :date
  end
end
