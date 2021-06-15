class AddIndexToSequoiaMember < ActiveRecord::Migration[6.1]
  def change
    add_index :sequoia_members, :uid, unique: true
  end
end
