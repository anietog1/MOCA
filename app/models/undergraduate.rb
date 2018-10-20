class Undergraduate < ApplicationRecord
  has_many :student_has_undergraduates, inverse_of: :undergraduate
  has_many :students, through: :student_has_undergraduates

  validates :name, presence: true, uniqueness: true
end
