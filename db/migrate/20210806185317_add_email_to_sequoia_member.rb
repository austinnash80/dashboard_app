class AddEmailToSequoiaMember < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_members, :email, :string
  end
end
