class SchedulesController < ApplicationController
  def index
    @advisor = Advisor.find(params.permit(:advisor_id)[:advisor_id])
  end

  def new
    @advisor = Advisor.find(params.permit(:advisor_id)[:advisor_id])
  end

  def show
  end

  def create
    # Get advisor data
    @advisor = Advisor.find(params.permit(:id)[:id])
    # Get student data
    student = @advisor.student
    sessions = @advisor.advisor_has_sessions
    tag_ids = params.permit(:tag_ids)[:tag_ids]

    tag_ids.each do |session|
      if session?
        Sessions.create(advisor_id: @advisor.id, day_has_hour_id: session, term_id: @advisor.term_id)
      end
    end
  end
end
