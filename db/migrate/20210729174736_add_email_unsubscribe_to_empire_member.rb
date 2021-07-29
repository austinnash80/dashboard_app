class AddEmailUnsubscribeToEmpireMember < ActiveRecord::Migration[6.1]
  def change
    add_column :empire_members, :email_unsubscribe, :boolean
  end
end
