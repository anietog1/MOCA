class SchedulesController < ApplicationController
  def index
    @advisor = Advisor.find(params.permit(:advisor_id)[:advisor_id])
  end

  def new
    @advisor = Advisor.find(params.permit(:advisor_id)[:advisor_id])
  end

  def create
    @advisor = Advisor.find(params.permit(:advisor_id)[:advisor_id])
    sessions = params.require(:sessions).permit!

    sessions.each do |day_has_hour_id, available|
      if available == "1"
        @advisor.sessions.create(day_has_hour_id: day_has_hour_id, term_id: 1)
      end
    end

    respond_to do |format|
      format.html { redirect_to advisor_schedules_url(@advisor),
                    notice: 'Schedule was successfully saved.' }
    end
  end
end
