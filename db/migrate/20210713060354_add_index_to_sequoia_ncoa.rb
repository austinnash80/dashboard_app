class AddIndexToSequoiaNcoa < ActiveRecord::Migration[6.1]
  def change
    add_index :sequoia_ncoas, :uid, unique: true
  end
end
