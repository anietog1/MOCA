class SessionHasStudent < ApplicationRecord
  belongs_to :session
  belongs_to :student

  validates :session, presence: true
  validates :student, presence: true
end
