class StudentHasUndergraduate < ApplicationRecord
  belongs_to :student
  belongs_to :undergraduate
end
