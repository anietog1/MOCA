class Applications::StudentsController < ApplicationController
  def index
    @students = Student.where(is_valid: nil)
  end

  def show
    @student = Student.find(params.permit(:id)[:id])
  end

  def accept
    @student = Student.find(params.permit(:id)[:id])
    @student.is_valid = true
    @student.save

    respond_to do |format|
      format.html { redirect_to applications_students_url, notice: 'Student was successfully accepted.' }
    end
  end

  def reject
    @student = Student.find(params.permit(:id)[:id])
    @student.is_valid = false
    @student.save

    respond_to do |format|
      format.html { redirect_to applications_students_url, notice: 'Student was successfully rejected.' }
    end
  end
end
