class Advisor < ApplicationRecord
  belongs_to :student
  belongs_to :term

  has_many :advisor_has_subjects
  has_many :subjects, through: :advisor_has_subjects

  has_many :sessions
end
