class WelcomeController < ApplicationController
  
 before_action :set_locale

  def set_locale
    I18n.locale = params[:locale].to_sym
  end
  
  def index
    if user_signed_in?
      if current_user.kind == 0
        redirect_to welcome_super_admin_path
      elsif current_user.kind == 1
        redirect_to welcome_admin_path
      elsif current_user.kind == 2
        redirect_to student_path(id: current_user.student_id)
      elsif current_user.kind == 3
        redirect_to advisor_path(id: Advisor.where(student_id: current_user.student_id).first)
      end
    end
  end

  def student
    @student = Student.find(current_user.student_id)
    @student_advices = SessionHasStudent.where(student_id: @student.id)
    @advices = []
    @student_advices.each do |sa|
      @advices << Session.find(sa.session_id)
    end
  end
end
