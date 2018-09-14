class AppstudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def validate
    @student = Student.find(params[:id])
    @student.is_valid = "True"
    @student.save
  end

end
