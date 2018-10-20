class Subject < ApplicationRecord
  has_many :advisor_has_subjects, inverse_of: :subject
  has_many :advisors, through: :advisor_has_subjects

  has_many :sessions

  validates :name, presence: true, uniqueness: true
end
