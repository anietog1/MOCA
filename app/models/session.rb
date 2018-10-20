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
    advisor = Advisor.find(advisor_id)
    student = Student.find(advisor.student_id)
    dhh = DayHasHour.find(day_has_hour_id)
    day = Day.find(dhh.day_id).name
    hour = Hour.find(dhh.hour_id).name
    if subject != nil then subject = Subject.find(subject_id).name end
    "MATERIA: #{subject}, MONITOR: #{student.full_name}, DIA: #{day}, HORA: #{hour}"
  end

end
