class Survey < ApplicationRecord
  belongs_to :session_has_student

  validates :satisfaction, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :contribution, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :conditions, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :domain, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :clarity, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :ability, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :treat, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :method, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :fears, presence: true
  validates :impact, presence: true
end
