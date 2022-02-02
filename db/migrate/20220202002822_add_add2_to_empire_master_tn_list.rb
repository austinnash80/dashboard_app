class AddAdd2ToEmpireMasterTnList < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_master_tn_lists, :add2, :string
  end
end
