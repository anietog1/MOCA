json.extract! student, :id, :first_name, :middle_name, :first_surname, :second_surname, :university_code, :university_username, :mobile_phone, :is_advisor, :is_valid, :created_at, :updated_at
json.url student_url(student, format: :json)
