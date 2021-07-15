json.extract! courses_pacific, :id, :number, :version, :title, :hours, :category, :sub_category, :pub_date, :sequoia_number, :sequoia_version, :text, :exam, :active, :new, :version_update, :update_sheet, :notes, :created_at, :updated_at
json.url courses_pacific_url(courses_pacific, format: :json)
