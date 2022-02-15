class AddDupToEmpireMember < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_members, :dup, :boolean
  end
end
