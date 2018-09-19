class Student < ApplicationRecord
  has_many :advisors

  has_many :student_has_undergraduates
  has_many :undergraduates, through: :student_has_undergraduates

  has_many :session_has_students
  has_many :sessions, through: :session_has_students

  validates :first_name, presence: true
  validates :first_surname, presence: true
  validates :university_code, presence: true, uniqueness: true
  validates :university_username, presence: true, uniqueness: true
  validates :mobile_phone, presence: true

  def full_name
    [first_name, middle_name, first_surname, second_surname].reject(&:nil?).join(' ')
  end
end
