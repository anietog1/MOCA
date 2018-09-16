class Advice < ApplicationRecord
  belongs_to :advisor_has_session
  belongs_to :student
end
