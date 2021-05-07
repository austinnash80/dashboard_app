json.extract! sequoia_customer, :id, :s_id, :order_id, :uid, :lic_state, :lic_num, :exisiting, :purchase_s, :purchase, :price_s, :price, :product_1, :product_2, :designation, :email, :fname, :lname, :street_1, :street_2, :city, :state, :zip, :created_at, :updated_at
json.url sequoia_customer_url(sequoia_customer, format: :json)
