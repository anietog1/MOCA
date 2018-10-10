class AdvicesController < ApplicationController
  def index
    @shs = SessionHasStudent.all
  end

  def new
    @shs = SessionHasStudent.new
  end

  def create
    @session = Session.where(form_params[:session_id])
    @shs = SessionHasStudent.new(student_id: student_params[:id], session_id: form_params[:session_id])
    respond_to do |format|
      if @shs.save
        @shs = SessionHasStudent.all
        format.html { render 'index', notice: 'Student was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @shs.errors, status: :unprocessable_entity }
      end
    end
  end

  def student_params
    { id: Student.find_by(university_code: form_params[:student_id]).id }
  end

  def form_params
    params.permit(:student_id, :session_id)
  end
end
