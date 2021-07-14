json.extract! courses_sequoium, :id, :number, :version, :title, :category, :sub_category, :hours, :pub_date, :pes_number, :pes_version, :text, :exam, :active, :notes, :created_at, :updated_at
json.url courses_sequoium_url(courses_sequoium, format: :json)
