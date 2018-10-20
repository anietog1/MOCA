# coding: utf-8
namespace :db do
  desc "Fills the database with some useful data. Just like seed, but it's not a seed."

  task populate: :environment do
    puts "[STUDENTS]"

    students_list = [
      ['Kevin', 'Arley', 'Parra', 'Henao', '201710093010', 'kaparrah', '316891432', true, true],
      ['Agustín', nil, 'Nieto', 'García', '201710094010', 'anietog1', '31789132432', true, true],
      ['Kevyn', 'Santiago', 'Alzate', 'Rodriguez', '201710095011', 'kevyng', '3178913242', false, true],
      ['Sebastian', nil, 'Perez', 'Restrepo', '201710096010', 'sebjaj', '31789132432', false, nil],
      ['Leo', nil, 'Perez', 'Restrepo', '20170096010', 'leprs', '31896132432', false, false],
      ['Mateo', nil, 'Perez', 'Restrepo', '20110096010', 'maprs', '37891632432', true, true],
      ['Alexis', nil, 'Perez', 'Restrepo', '01096010', 'alprs', '31389132432', false, nil],
      ['Patata', nil, 'Perez', 'Restrepo', '2171006010', 'patprs', '29616324362', false, true],
      ['Peludo', nil, 'Perez', 'Restrepo', '2071096010', 'pelprs', '37896366432', false, nil],
      ['Parroco', nil, 'Perez', 'Restrepo', '20170096010', 'parprs', '37591324632', true, true],
      ['Aleta', nil, 'Perez', 'Restrepo', '2017096010', 'aleeeprs', '37491632432', false, true],
      ['Esqueleto', nil, 'Perez', 'Restrepo', '210096010', 'esqprs', '37816632432', false, nil],
      ['Azulejo', nil, 'Perez', 'Restrepo', '2010096010', 'azprs', '37896232432', false, nil],
      ['Siemens', nil, 'Perez', 'Restrepo', '21096010', 'siprs', '37895632432', true, true],
      ['Torre', nil, 'Perez', 'Restrepo', '2076010', 'torprs', '31789134432', false, false],
      ['Sara', nil, 'Perez', 'Restrepo', '201096010', 'saraprs', '31789133431', false, true]
    ]

    students_list.each do |first_name, middle_name, first_surname, second_surname, university_code, university_username, mobile_phone, is_advisor, is_valid|
      Student.create(
        first_name: first_name, middle_name: middle_name,
        first_surname: first_surname, second_surname: second_surname,
        university_code: university_code, university_username: university_username,
        mobile_phone: mobile_phone, is_advisor: is_advisor, is_valid: is_valid
      )
    end

    puts "[SUBJECTS]"

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

    puts "[TERMS]"

    semesters_list = [
      ['2018-1', '2018-01-12', '2018-06-20'],
      ['2018-2', '2018-07-16', '2018-12-04'],
      ['2019-1', '2019-01-12', '2019-06-20'],
      ['2019-2', '2019-07-16', '2019-12-04']
    ]

    semesters_list.each do |name, start_date, end_date|
      Semester.create(name: name, start_date: start_date, end_date: end_date)
    end

    puts "[UNDERGRADUATES]"

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

    puts "[STUDENT_HAS_UNDERGRADUATES]"

    student_has_undergraduates_list = [
      [1, 1],
      [1, 2],
      [2, 1],
      [2, 2],
      [3, 2],
      [4, 1],
      [5, 1],
      [6, 4],
      [7, 1],
      [8, 7],
      [9, 1],
      [10, 2],
      [11, 1],
      [12, 1],
      [13, 4],
      [14, 6],
      [15, 5]
    ]

    student_has_undergraduates_list.each do |student, undergraduate|
      Student.find(student).undergraduates << Undergraduate.find(undergraduate)
    end

    puts "[ADVISORS]"

    advisors_list = [
      [1, 1, true],
      [3, 1, false],
      [2, 1, true],
      [1, 2, true],
      [2, 2, true],
      [3, 2, nil],
      [6, 2, true],
      [10, 2, true],
      [13, 2, true]
    ]

    advisors_list.each do |student, semester, is_valid|
      Advisor.create(student_id: student, semester_id: semester + 1, is_valid: is_valid)
    end

    puts "[ADVISOR_HAS_SUBJECTS]"

    advisor_has_subjects_list = [
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 4],
      [2, 5],
      [2, 6],
      [2, 7],
      [3, 3],
      [4, 2],
      [5, 1],
      [6, 2],
      [7, 5],
      [8, 9]
    ]

    advisor_has_subjects_list.each do |advisor, subject|
      Advisor.find(advisor).subjects << Subject.find(subject)
    end

    puts "[SESSIONS]"

    sessions_list = [
      [1, 1, 1, nil],
      [1, 1, 2, 1],
      [1, 1, 3, nil],
      [1, 1, 4, nil],
      [1, 1, 10, 5],
      [1, 3, 5, 6],
      [1, 3, 6, nil],
      [1, 3, 8, 2],
      [1, 3, 9, 6],
      [2, 4, 1, nil],
      [2, 4, 2, 6],
      [2, 4, 3, 6],
      [2, 4, 8, nil],
      [2, 5, 20, nil],
      [2, 5, 30, nil],
      [2, 5, 5, 3],
      [2, 5, 6, nil],
      [2, 7, 4, 1],
      [2, 7, 40, 1],
      [2, 7, 14, nil],
      [2, 7, 15, nil],
      [2, 8, 16, 3],
      [2, 8, 2, nil],
      [2, 8, 9, 5],
      [2, 8, 56, nil],
      [2, 9, 34, nil],
      [2, 9, 12, 2],
      [2, 9, 34, 4],
      [2, 9, 59, nil]
    ]

    sessions_list.each do |month, advisor, day_has_hour, subject|
      Session.create!(month_id: month, advisor_id: advisor, day_has_hour_id: day_has_hour, subject_id: subject)
    end

    puts "[SESSION_HAS_STUDENTS]"

    session_has_students_list = [
      [2, 1],
      [2, 4],
      [5, 1],
      [6, 2],
      [8, 3],
      [9, 15],
      [11, 14],
      [12, 13],
      [16, 11],
      [18, 12],
      [19, 4],
      [22, 5],
      [24, 3],
      [27, 2],
      [28, 1]
    ]

    session_has_students_list.each do |session, student|
      Session.find(session).students << Student.find(student)
    end
  end # task :populate
end # namespace :db
