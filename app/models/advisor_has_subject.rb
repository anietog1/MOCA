class AdvisorHasSubject < ApplicationRecord
  belongs_to :advisor
  belongs_to :subject
end
