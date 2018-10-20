class Meeting < ApplicationRecord
  belongs_to :session
  belongs_to :classroom
end
