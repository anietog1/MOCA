# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
student_list = [
  [ "Kevin", "Arley", "Parra", "Henao", "201710093010", "kaparrah", "316891432" "True", "True" ],
  [ "Agustín", "", "Nieto", "García", "201710094010", "anietog1", "31789132432", "True", "False" ],
  [ "Kevyn", "Santiago", "Alzate", "Rodriguez", "201710095011", "kevyng", "317891324we2", "False", "True" ],
  [ "Sebastian", "", "Perez", "Restrepo", "201710096010", "anietog1", "31789132432", "False", "False" ]
]

student_list.each do |first_name, middle_name, first_surname, second_surname, university_code, university_username, mobile_phone, is_advisor, is_valid|
  Student.create(first_name: first_name, middle_name: middle_name, first_surname: first_surname, second_surname: second_surname, university_code: university_code, university_username: university_username, mobile_phone: mobile_phone, is_advisor: is_advisor, is_valid: is_valid)
end
