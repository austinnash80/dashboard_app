json.extract! empire_customer, :id, :e_id, :uid, :lic_state, :lic_num, :existing, :purchase_s, :purchase, :price_s, :price, :product, :email, :fname, :lname, :street_1, :street_2, :city, :state, :zip, :created_at, :updated_at
json.url empire_customer_url(empire_customer, format: :json)
