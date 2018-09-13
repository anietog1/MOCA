class Subject < ApplicationRecord
  has_many :advisors, through: :advisor_has_subjects

  validates :name, presence: true, uniqueness: true
end
