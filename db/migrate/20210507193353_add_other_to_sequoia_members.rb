class AddOtherToSequoiaMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_members, :other, :integer
  end
end
