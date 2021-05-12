class CreateDailySales < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_sales do |t|
      t.date :day
      t.string :year
      t.string :month
      t.string :day_of_week
      t.integer :sales
      t.integer :cpa_full_price
      t.integer :cpa_renewal_price
      t.integer :ea_full_price
      t.integer :ea_renewal_price
      t.integer :ethics
      t.integer :afsp
      t.integer :other

      t.timestamps
    end
  end
end
