class AdvisorHasSession < ApplicationRecord
  belongs_to :advisor
  belongs_to :day_has_hour
  belongs_to :term

  has_many :advices
  has_many :students, through: :advices
end
