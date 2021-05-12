json.extract! daily_sale, :id, :day, :year, :month, :day_of_week, :sales, :cpa_full_price, :cpa_renewal_price, :ea_full_price, :ea_renewal_price, :ethics, :afsp, :other, :created_at, :updated_at
json.url daily_sale_url(daily_sale, format: :json)
