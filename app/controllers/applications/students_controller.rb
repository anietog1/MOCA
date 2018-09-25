class Applications::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :accept, :reject]

  def index
    @students = Student.where(is_valid: nil)
  end

  def show
  end

  def accept
    @student.is_valid = true
    @student.save

    respond_to do |format|
      format.html {
        redirect_to applications_students_url,
        notice: 'Student was successfully accepted.'
      }
    end
  end

  def reject
    @student.is_valid = false
    @student.save

    respond_to do |format|
      format.html {
        redirect_to applications_students_url,
        notice: 'Student was successfully rejected.'
      }
    end
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end
end
