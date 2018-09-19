# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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


hours_list = (7..19).map { |num| num.to_s + ":00" }

hours_list.each do |hour|
  Hour.create(name: hour)
end

day_has_hours_list = ((1..days_list.size).map { |day_id| ([day_id] * hours_list.size).zip(1..hours_list.size) }).flatten 1

day_has_hours_list.each do |day_id, hour_id|
  DayHasHour.create(day_id: day_id, hour_id: hour_id)
end

students_list = [
  ['Kevin', 'Arley', 'Parra', 'Henao', '201710093010', 'kaparrah', '316891432', true, true],
  ['Agustín', nil, 'Nieto', 'García', '201710094010', 'anietog1', '31789132432', true, true],
  ['Kevyn', 'Santiago', 'Alzate', 'Rodriguez', '201710095011', 'kevyng', '3178913242', false, true],
  ['Sebastian', nil, 'Perez', 'Restrepo', '201710096010', 'sebjaj', '31789132432', false, nil],
  ['Leo', nil, 'Perez', 'Restrepo', '20170096010', 'leprs', '31896132432', false, false],
  ['Mateo', nil, 'Perez', 'Restrepo', '20110096010', 'maprs', '37891632432', false, true],
  ['Alexis', nil, 'Perez', 'Restrepo', '01096010', 'alprs', '31389132432', false, nil],
  ['Patata', nil, 'Perez', 'Restrepo', '2171006010', 'patprs', '29616324362', false, true],
  ['Peludo', nil, 'Perez', 'Restrepo', '2071096010', 'pelprs', '37896366432', false, nil],
  ['Parroco', nil, 'Perez', 'Restrepo', '20170096010', 'parprs', '37591324632', false, true],
  ['Aleta', nil, 'Perez', 'Restrepo', '2017096010', 'aleeeprs', '37491632432', false, true],
  ['Esqueleto', nil, 'Perez', 'Restrepo', '210096010', 'esqprs', '37816632432', false, nil],
  ['Azulejo', nil, 'Perez', 'Restrepo', '2010096010', 'azprs', '37896232432', false, nil],
  ['Siemens', nil, 'Perez', 'Restrepo', '21096010', 'siprs', '37895632432', false, true],
  ['Torre', nil, 'Perez', 'Restrepo', '2076010', 'torprs', '31789134432', false, false],
  ['Sara', nil, 'Perez', 'Restrepo', '201096010', 'saraprs', '31789133431', false, true]
]

students_list.each do |first_name, middle_name, first_surname, second_surname, university_code, university_username, mobile_phone, is_advisor, is_valid|
  Student.create(first_name: first_name, middle_name: middle_name, first_surname: first_surname, second_surname: second_surname, university_code: university_code, university_username: university_username, mobile_phone: mobile_phone, is_advisor: is_advisor, is_valid: is_valid)
end

advisors_list = Student.where(is_advisor: true)


subjects_list = [
  'Calculo I',
  'Calculo II',
  'Calculo III',
  'Fisica I',
  'Fisica II',
  'Logica',
  'Fundamentos de programacion',
  'Fisica I',
  'Algebra lineal',
  'Ingenieria de software',
  'Proyecto integrador',
  'Analisis textual',
  'Practicas textuales',
  'Estadistica',
  'Quimica inorganica',
  'Quimica organica',
]

subjects_list.each do |name|
  Subject.create(name: name)
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

undergraduates_list = [
  'Ingenieria de sistemas',
  'Ingenieria matematica',
  'Administracion',
  'Ingenieria fisica',
  'Geologia',
  'Biologia',
  'Economia',
  'Ingenieria mecanica',
  'Ingenieria civil'
]

undergraduates_list.each do |name|
  Undergraduate.create(name: name)
end
