class AdvicesController < ApplicationController
  def index
    @sessions = Session.all
  end

  def new
    @session = Session.new
  end

  # UNFINISHED
  def create
    sessions = Session.where(session_params)

    if sessions.any?
      
    else
      sessions = Session.where(session_params.except(:subject_id))

      if sessions.any?

      end
    end
  end

  private
  def session_params
    temp = params.require(:advice).permit(:term_id, :day_id, :hour_id, :subject_id)

    {
      term_id: temp[term_id],
      day_has_hour_id: DayHasHour.find_by(day_id: temp[:day_id], hour_id: temp[:hour_id]),
      subject_id: temp[term_id]
    }
  end

  def student_params
    temp = params.require(:advice).permit(:student_university_code)

    { id: Student.find_by(university_code: temp[:student_university_code]).id }
  end
end
