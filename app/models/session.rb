class Session < ApplicationRecord
  belongs_to :month
  belongs_to :advisor
  belongs_to :day_has_hour
  belongs_to :subject, optional: true

  has_many :session_has_students
  has_many :students, through: :session_has_students

  validates :month, presence: true
  validates :advisor, presence: true
  validates :day_has_hour, presence: true

  def formatted_name
    if subject? then
      "SUBJECT: #{subject.name}. DAY: #{day.name}. HOUR: #{hour.name}"
    else
      subjects_names = advisor.subjects.map {|subject| subject.name}
      "SUBJECTS: #{subjects_names.join(', ')}. DAY: #{day.name}. HOUR: #{hour.name}"
    end
  end

  def semester
    advisor.semester
  end

  def day
    day_has_hour.day
  end

  def hour
    day_has_hour.hour
  end
end
