class AddMembershipExpToSequoiaMember < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_members, :membership_exp, :date
  end
end
