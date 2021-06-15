class AddIndexToSequoiaMemberExp < ActiveRecord::Migration[6.1]
  def change
    add_index :sequoia_member_exps, :uid, unique: true
  end
end
