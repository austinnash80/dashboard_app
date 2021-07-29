class AddEmailUnsubscribeToSequoiaMember < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_members, :email_unsubscribe, :boolean
  end
end
