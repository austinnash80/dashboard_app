json.extract! courses_pe, :id, :number, :version, :title, :category, :sub_category, :hours, :pub_date, :update, :new, :notes, :created_at, :updated_at
json.url courses_pe_url(courses_pe, format: :json)
