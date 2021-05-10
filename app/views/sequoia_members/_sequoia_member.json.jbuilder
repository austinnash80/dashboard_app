json.extract! sequoia_member, :id, :uid, :lname, :first_purchase, :last_purchase, :cpa, :cpa_memberships, :ea, :memberships, :afsp, :afsp_purchases, :ethics, :ethics_purchases, :created_at, :updated_at
json.url sequoia_member_url(sequoia_member, format: :json)
