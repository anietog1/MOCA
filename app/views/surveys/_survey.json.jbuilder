json.extract! survey, :id, :session_has_student_id, :satisfaction, :contribution, :conditions, :domain, :clarity, :ability, :treat, :method, :fears, :impact, :comments, :created_at, :updated_at
json.url survey_url(survey, format: :json)
