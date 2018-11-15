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
    @session = Session.where(form_params[:session_id]).first
    @shs = SessionHasStudent.new(student_id: student_params[:id], session_id: form_params[:session_id])
    respond_to do |format|
      if @shs.save
        msg = ""
        if @session.session_has_students.size >= 2 then
          msg = "Quedan pocos cupos para esta monitoria."
          AdviceMailer.alert_advice_size("kaparrahe@gmail.com", @session).deliver
        end
        if current_user.kind == 0 or current_user.kind == 1
        format.html { redirect_to advices_path, notice: 'La monitoría fue registrada.'+ msg}
        format.json { render :index }
        else
        format.html { redirect_to current_user.student, notice: 'La monitoría fue registrada.'+ msg}
        format.json { render :show }
          
        end

      else
        format.html { render :new }
        format.json { render json: @shs.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shs = SessionHasStudent.where(session_id: params[:id], student_id: params[:su]).first
    @survey = Survey.where(session_has_student_id: @shs.id)
    @shs.destroy
    @survey.destroy
    respond_to do |format|
      if current_user.kind == 0 or current_user.kind == 1
      format.html { redirect_to advices_path, notice: 'Advice was successfully destroyed.' }
      format.json { head :no_content }
      else
        format.html { redirect_to current_user.student, notice: 'Advice was successfully destroyed.' }
      format.json { head :no_content }
      
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
