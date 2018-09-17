# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
students_list = [
  ['Kevin', 'Arley', 'Parra', 'Henao', '201710093010', 'kaparrah', '316891432' 'True', 'True'],
  ['Agustín', '', 'Nieto', 'García', '201710094010', 'anietog1', '31789132432', 'True', 'False'],
  ['Kevyn', 'Santiago', 'Alzate', 'Rodriguez', '201710095011', 'kevyng', '3178913242', 'False', 'True'],
  ['Sebastian', '', 'Perez', 'Restrepo', '201710096010', 'anietog1', '31789132432', 'False', 'False']
]

students_list.each do |first_name, middle_name, first_surname, second_surname, university_code, university_username, mobile_phone, is_advisor, is_valid|
  Student.create(first_name: first_name, middle_name: middle_name, first_surname: first_surname, second_surname: second_surname, university_code: university_code, university_username: university_username, mobile_phone: mobile_phone, is_advisor: is_advisor, is_valid: is_valid)
end

subjects_list = [
  'Calculo',
  'Logica',
  'Fundamentos de programación'
]

subjects_list.each do |name|
  Subject.create(name: name.first)
end

terms_list = [
  ['2018-1', '2018-01-12', '2018-06-20'],
  ['2018-2', '2018-07-16', '2018-12-04'],
  ['2019-1', '2019-01-12', '2019-06-20'],
  ['2019-2', '2019-07-16', '2019-12-04']
]

terms_list.each do |name, start_date, end_date|
  Term.create(name: name, start_date: start_date, end_date: end_date)
end

days_list = [
  'Lunes',
  'Martes',
  'Miércoles',
  'Jueves',
  'Viernes'
]

days_list.each do |name|
  Day.create(name: name)
end
# Las monitorías son hasta las 6 pm?
hours_list = [
  '07:00 AM' ,
  '08:00 AM' ,
  '09:00 AM' ,
  '10:00 AM' ,
  '11:00 AM' ,
  '12:00 PM' ,
  '01:00 PM' ,
  '02:00 PM' ,
  '03:00 PM' ,
  '04:00 PM' ,
  '05:00 PM' ,
  '06:00 PM' ,
]

hours_list.each do |name|
  Hour.create(name: name)
end

undergraduates_list = [
  'Ingeniería de sistemas',
  'Ingeniería matemática',
  'Administración'
]

undergraduates_list.each do |name|
  Undergraduate.create(name: name)
end
