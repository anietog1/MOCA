class DayHasHour < ApplicationRecord
  has_many :sessions
  belongs_to :day
  belongs_to :hour
end
