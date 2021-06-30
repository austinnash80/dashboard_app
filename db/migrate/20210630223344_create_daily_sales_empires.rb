class CreateDailySalesEmpires < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_sales_empires do |t|
      t.date :day
      t.string :year
      t.string :month
      t.string :day_of_week
      t.integer :sales
      t.integer :orders

      t.timestamps
    end
  end
end
