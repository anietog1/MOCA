class Advisor < ApplicationRecord
  belongs_to :student
  belongs_to :semester

  has_many :advisor_has_sessions

  has_many :advisor_has_subjects, inverse_of: :advisor
  has_many :subjects, through: :advisor_has_subjects

  has_many :sessions

  accepts_nested_attributes_for :advisor_has_subjects, allow_destroy: true
end
