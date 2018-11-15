# coding: utf-8
class AdvicesController < ApplicationController
  def index
    @sessions = Session.where.not(subject: nil)
  end

  def new
    @sessions = Session.left_joins(:subject).order('subjects.name')
  end

  def create
    if current_user.kind != 2
      @shs = SessionHasStudent.new(student_id: student_params[:id], session_id: form_params[:session_id])
    else
      @shs = SessionHasStudent.new(student_id: current_user.student.id, session_id: form_params[:session_id])
    end

    respond_to do |format|
      if @shs.save
        @session = Session.where(form_params[:session_id]).first
        msg = ''

        if @session.session_has_students.size >= 2 then
          msg = 'Quedan pocos cupos para esta monitoria.'
          AdviceMailer.alert_advice_size("kaparrahe@gmail.com", @session).deliver
        end

        if current_user.kind != 2
          format.html { redirect_to advices_path, notice: 'La monitoría fue registrada.'+ msg }
          format.json { render :index }
        else
          format.html { redirect_to current_user.student, notice: 'La monitoría fue registrada.'+ msg }
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
    { id: Student.find_by_university_code(form_params[:student_university_code]).id }
  end

  def form_params
    params.permit(:session_id, :student_university_code)
  end
end
