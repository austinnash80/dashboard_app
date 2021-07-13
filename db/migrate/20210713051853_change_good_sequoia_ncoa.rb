class ChangeGoodSequoiaNcoa < ActiveRecord::Migration[6.1]
  def change
    rename_column :sequoia_ncoas, :good, :new
  end
end
