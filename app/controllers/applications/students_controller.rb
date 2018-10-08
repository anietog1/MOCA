class Applications::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :accept, :reject]

  def index
    @students = Student.where(is_valid: nil)
  end

  # We need still do several undergraduates operations
  def show
    @undergraduate = @student.student_has_undergraduates.first.undergraduate_id
  end

  def accept
    @student.is_valid = true
    @under = Undergraduate.find(form_params[:undergraduate_id])
    @consul = StudentHasUndergraduate.where(:student_id => @student.id, :undergraduate_id => @student.student_has_undergraduates.first.undergraduate_id).first
    @consul.undergraduate_id = @under.id
    @consul.save
    @student.save
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
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

  #Undergraduate_id is good?, isn't student_has_undergraduates?
  def student_params
    { first_name: form_params[:first_name],
      middle_name: form_params[:middle_name],
      first_surname: form_params[:first_surname],
      second_surname: form_params[:second_surname],
      university_code: form_params[:university_code],
      university_username: form_params[:university_username],
      mobile_phone: form_params[:mobile_phone]
    }
  end
  
  def form_params
    params.require(:student).permit(:first_name, :middle_name, :first_surname, :second_surname, :university_code, :university_username, :mobile_phone, :is_advisor, :is_valid, :undergraduate_id )
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end
end
