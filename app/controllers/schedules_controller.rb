class SchedulesController < ApplicationController
  before_action :set_advisor, only: [:show, :new, :create]

  def show
  end

  def new
  end

  def create
    sessions_params.each do |day_has_hour_id, is_available|
      if is_available == "1"
        @advisor.sessions.create(day_has_hour_id: day_has_hour_id, term_id: @advisor.term_id)
      end
    end

    respond_to do |format|
      format.html {
        redirect_to advisor_schedule_url(@advisor),
        notice: 'Schedule was successfully saved.'
      }
    end
  end

  private
  def set_advisor
    @advisor = Advisor.find_by(advisor_params)
  end

  def advisor_params
    { id: params.permit(:advisor_id)[:advisor_id] }
  end

  def sessions_params
    params.require(:sessions).permit!
  end
end