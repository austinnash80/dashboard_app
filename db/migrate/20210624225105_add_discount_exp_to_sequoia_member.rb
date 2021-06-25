class AddDiscountExpToSequoiaMember < ActiveRecord::Migration[6.1]
  def change
    add_column :sequoia_members, :discount_exp, :date
  end
end
