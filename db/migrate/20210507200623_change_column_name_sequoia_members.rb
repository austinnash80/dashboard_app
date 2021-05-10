class ChangeColumnNameSequoiaMembers < ActiveRecord::Migration[6.1]
  def change
    rename_column :sequoia_members, :memberships, :ea_memberships
  end
end
