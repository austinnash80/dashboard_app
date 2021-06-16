class AddIndexToEmpireMember < ActiveRecord::Migration[6.1]
  def change
    add_index :empire_members, :uid, unique: true
  end
end
