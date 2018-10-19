class SessionsController < ApplicationController

  def index
    @sessions = Session.all
  end

  def new
    @session = Session.new
  end

  def show
  end

  def create
    @sessions = Session.new(session_params)
    @shs = SessionHasStudent.create(session_id: @session.id, student_id: form_params[:student_id])
    @shs.save
    @dhh = DayHasHour.create(day_id: form_params[:day_id], hour_id: form_params[:hour_id] )
    @dhh.save
    @ahs = AdvisorHasSubject.create(advisor_id: session_params[:advisor_id], subject_id: form_params[:subject_id] )
    @ahs.save
    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end



  def session_params
    {
      month_id: form_params[:month_id],
      day_has_hour_id: form_params[:day_has_hour_id],
      advisor_id: form_params[:advisor_id ]
    }
  end


  private
  def form_params
    params.require(:session).permit(:semester_id, :day_id, :hour_id, :subject_id, :student_id)
  end
end
