class Undergraduate < ApplicationRecord
  has_many :student_has_undergraduates
  has_many :students, through: :student_has_undergraduates

  validates :name, presence: true
end
