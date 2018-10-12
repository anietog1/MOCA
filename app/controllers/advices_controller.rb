# coding: utf-8
class AdvicesController < ApplicationController
  def index
    @shs = SessionHasStudent.all
    @advices = Session.all
  end

  def new
    @shs = SessionHasStudent.new
  end

  def create
    @session = Session.where(form_params[:session_id])
    @shs = SessionHasStudent.new(student_id: student_params[:id], session_id: form_params[:session_id])
    respond_to do |format|
      if @shs.save
        msg = ""
        if @session.size >= 2 then
          msg = "Quedan pocos cupos para esta monitoria."
          AdviceMailer.alert_advice_size("eevinley@gmail.com", @shs).deliver
        end
        format.html { redirect_to advices_path, notice: 'La monitoría fue registrada.'+ msg}
        format.json { render :index }
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
