json.extract! sequoia_product_list, :id, :product, :who, :type, :created_at, :updated_at
json.url sequoia_product_list_url(sequoia_product_list, format: :json)
