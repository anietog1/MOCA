class Environment < ApplicationRecord
  belongs_to :semester
  belongs_to :month

  validates :semester, presence: true
  validates :month, presence: true
end
