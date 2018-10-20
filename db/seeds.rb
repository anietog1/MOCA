# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '[DAYS]'

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

puts '[HOURS]'

hours_list = (7..19).map { |num| num.to_s + ':00' }

hours_list.each do |hour|
  Hour.create(name: hour)
end

puts '[DAY_HAS_HOURS]'

day_has_hours_list = ((1..days_list.size).map { |day_id| ([day_id] * hours_list.size).zip(1..hours_list.size) }).flatten 1

day_has_hours_list.each do |day_id, hour_id|
  DayHasHour.create(day_id: day_id, hour_id: hour_id)
end

puts '[MONTHS]'

months_list = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre'  
]

months_list.each do |name|
  Month.create(name: name)
end

# Setup environment. If it's not done, MOCA would be broken as hell

puts '[ENVIRONMENT]'

default_semester = { name: 'INICIO_DE_MOCA', start_date: '1999-12-29', end_date: '1999-12-29' }

Semester.create(default_semester)

Environment.create(semester_id: 1, month_id: 1)
