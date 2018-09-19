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
  end

  def edit
  end

  def show_creating
  end
end
