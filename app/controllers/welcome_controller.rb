class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.kind == 0
        render "super_admin"
      elsif current_user.kind == 1
        render "admin"
      elsif current_user.kind == 2
        render "student"
      elsif current_user.kind == 3
        render "advisor"
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
