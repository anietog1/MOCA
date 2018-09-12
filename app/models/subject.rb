class Subject < ApplicationRecord
  has_many :advisor_has_subjects
  has_many :advisors, through: :advisor_has_subjects

  validates :name, presence: true
end
