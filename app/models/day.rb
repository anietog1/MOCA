class Day < ApplicationRecord
    has_many :day_has_hours
    has_many :hours, through: :day_has_hours
    has_many :sessions, through: :day_has_hours

    validates :name, presence: true, uniqueness: true
end
