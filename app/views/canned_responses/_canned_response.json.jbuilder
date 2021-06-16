json.extract! canned_response, :id, :company, :des, :state, :questions, :answer, :notes, :created_at, :updated_at
json.url canned_response_url(canned_response, format: :json)
