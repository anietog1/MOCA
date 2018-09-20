class SessionsController < ApplicationController
  def index
    # Get advisor data
    @advisor = Advisor.find(params.permit(:id)[:id])
    # Get student data
    @student = Student.find(@advisor.student_id)
    @days = Day.all
    @hours = Hour.all
    @sessions = AdvisorHasSession.all
    @day_has_hours = DayHasHour.all
  end

  def create
    # Get advisor data
    @advisor = Advisor.find(params.permit(:id)[:id])
    # Get student data
    @student = Student.find(@advisor.student_id)
    @sessions = @advisor.advisor_has_sessions
    tag_ids = params.permit({ :tag_ids => [] })[:tag_ids]
    tag_ids.each do |session|
      if session == true
        sessions.create(advisor_id: @advisor.id, day_has_hour_id: session )
      end
    end
  end

  def edit
  end

  def show_creating
    @advisor = Advisor.find(params.permit(:id)[:id])
    @days = Day.all
    @hours = Hour.all
    @sessions_show = DayHasHour.all
  end
end
