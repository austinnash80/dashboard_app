class FixStree1SequoiaNcoa < ActiveRecord::Migration[6.1]
  def change
    rename_column :sequoia_ncoas, :stree_1, :street_1
  end
end
