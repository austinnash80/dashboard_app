class CreateAutoRenewLists < ActiveRecord::Migration[6.1]
  def change
    create_table :auto_renew_lists do |t|
      t.integer :uid

      t.timestamps
    end
  end
end
