class SessionsController < ApplicationController
  def show
    @session = Session.find(params[:format].to_i)
  end

  def take_attendance
    session = Session.find(params[:session_id])
    student = Student.find(params[:student_id])
    date = Date.today

    query = session.meetings.where(date: date)
    if query.any?
      Attendance.create(meeting: query.first, student: student)
    else
      meeting = Meeting.new(session: session, date: date).save(validate: false)
      Attendance.create(meeting: meeting, student: student)
    end

    respond_to do |format|
      format.html {
        redirect_to sessions_show_path(session)
      }
    end
  end
end
