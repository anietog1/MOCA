class Student < ApplicationRecord
  has_many :advisors

  has_many :student_has_undergraduates, inverse_of: :student
  has_many :undergraduates, through: :student_has_undergraduates

  has_many :session_has_students
  has_many :sessions, through: :session_has_students

  accepts_nested_attributes_for :student_has_undergraduates, allow_destroy: true

  validates :first_name, presence: true
  validates :first_surname, presence: true
  validates :university_code, presence: true, uniqueness: true
  validates :university_username, presence: true, uniqueness: true
  validates :mobile_phone, presence: true

  def full_name
    [first_name, middle_name, first_surname, second_surname]
      .compact.reject(&:nil?).join(' ')
  end

  def self.to_csv
    attributes = %w{full_name university_code university_username}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |student|
        csv << attributes.map{ |attr| student.send(attr) }
      end
    end
  end
end
