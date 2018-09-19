class Session < ApplicationRecord
  belongs_to :term
  belongs_to :advisor
  belongs_to :day_has_hour
  belongs_to :subject

  has_many :session_has_students
  has_many :students, through: :session_has_students

  validates :term, presence: true
  validates :advisor, presence: true
  validates :day_has_hour, presence: true
end
