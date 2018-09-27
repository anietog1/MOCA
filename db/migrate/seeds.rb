# coding: utf-8
student_list = [
  [ "Kevin", "Arley", "Parra", "Henao", "201710093010", "kaparrah", "316891432" "True", "True" ],
  [ "Agustín", "", "Nieto", "García", "201710094010", "anietog1", "31789132432", "True", "False" ],
  [ "Kevyn", "Santiago", "Alzate", "Rodriguez", "201710095011", "kevyng", "317891324we2", "False", "True" ],
  [ "Sebastian", "", "Perez", "Restrepo", "201710096010", "anietog1", "31789132432", "False", "False" ]
]

student_list.each do |first_name, middle_name, first_surname, second_surname, university_code, university_username, mobile_phone, is_advisor, is_valid|
  Student.create(first_name: first_name, middle_name: middle_name, first_surname: first_surname, second_surname: second_surname, university_code: university_code, university_username: university_username, mobile_phone: mobile_phone, is_advisor: is_advisor, is_valid: is_valid)
end

subject_list = [
  ["Cálculo"],
  ["Lógica"],
  ["Fundamentos de programación"]
]

subject_list.each do |name|
  Subject.create(name: name)
end

term_list = [
  ["201801","2018-01-12","2018-06-20"],
  ["201802","2018-07-16","2018-12-04"],
  ["201901","2019-01-12","2019-06-20"],
  ["201902","2019-07-16","2019-12-04"]
]

term_list.each do |name, start_date, end_date|
  Term.create(name: name, start_date: start_date, end_date: end_date)
end

undergraduate_list = [
  ["Ingeniería de sistemas"],
  ["Ingeniería matemática"],
  ["Administración"]
]

undergraduate_list.each do |name|
  Undergraduate.create(name: name)
end
