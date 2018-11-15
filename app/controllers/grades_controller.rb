class GradesController < ApplicationController
  def show
  end

  def update
    @advisor = Advisor.find(params[:advisor_id])
    #@advisor = Advisor.find(form_params[:advisor_id]).first
    #sd = @advisor.student_id
    @student = Student.where(id: student_params[:id]).first
    if @student.advisor_grade != nil
      ag = form_params[:advisor_grade].to_f
      g = (@student.advisor_grade.to_f + ag)/2.0
    else
      g = form_params[:advisor_grade].to_f
    end
    respond_to do |format|
      if @student.update(advisor_grade: g)
        if current_user.kind == 0 or current_user.kind == 1
          format.html { redirect_to advisors_path, notice: 'Your qualify was successfully sent.' }
          format.json { render :index }
        else
          format.html { redirect_to current_user.student, notice: 'Your qualify was successfully sent.' }
          format.json { render :show }
        end
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def student_params
    { id: Advisor.find(advisor_params[:id]).student_id }
  end

  def advisor_params
    { id: params.permit(:advisor_id)[:advisor_id] }
  end

  def form_params
    params.require(:grade).permit(:advisor_grade)
  end
end
