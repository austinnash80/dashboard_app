class AddAdd2ToEmpireMasterIlList < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_master_il_lists, :add2, :string
  end
end
