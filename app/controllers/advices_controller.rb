class AdvicesController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      redirect_to @session
    else
      render 'new'
    end
  end

  private
  def session_params
    params.require(:session)
      .permit(:term_id, :day_id, :hour_id, :advisor_id, :student_id)
  end
end
