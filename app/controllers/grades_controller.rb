class GradesController < ApplicationController
  def show
  end

  def update
     @advisor = Advisor.where(advisor_id: form_params[:advisor_id])
     #@advisor = Advisor.find(form_params[:advisor_id]).first
    #sd = @advisor.student_id
    @student = Student.find(student_params[:id])
  	respond_to do |format|
      if @student.update(advisor_grade: form_params[:advisor_grade])
        format.html { redirect_to advisors_path, notice: 'Your qualify was successfully sent.' }
        format.json { render :index }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def student_params
    { id: Advisor.find_by(advisor_params[:id]).student_id }
  end

  def advisor_params
    { id: params.permit(:advisor_id)[:advisor_id] }
  end

   def form_params
    params.permit(:advisor_id, :advisor_grade)
  end
end
