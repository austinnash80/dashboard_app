class AddEmpireMemberEIdToIdNumberStorage < ActiveRecord::Migration[6.1]
  def change
    add_column :id_number_storages, :empire_member_e_id, :integer
  end
end
