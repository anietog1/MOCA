class Undergraduate < ApplicationRecord
  has_many :students, through: :student_has_undergraduates

  validates :name, presence: true, uniqueness: true
end
