class AddEmailToEmpireMember < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_members, :email, :string
    add_column :empire_members, :lic_num, :string
  end
end
