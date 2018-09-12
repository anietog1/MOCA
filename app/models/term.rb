class Term < ApplicationRecord
  has_many :advisors

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
