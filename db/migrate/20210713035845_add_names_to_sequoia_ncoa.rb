class AddNamesToSequoiaNcoa < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_ncoas, :fname, :string
    add_column :sequoia_ncoas, :lname, :string
  end
end
