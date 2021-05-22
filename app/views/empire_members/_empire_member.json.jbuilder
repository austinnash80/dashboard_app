json.extract! empire_member, :id, :uid, :lname, :first_purchase, :last_purchase, :state, :purchases, :created_at, :updated_at
json.url empire_member_url(empire_member, format: :json)
