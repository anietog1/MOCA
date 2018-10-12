class GradesController < ApplicationController
  def show
  end

  def update
  	respond_to do |format|
      if @student.update(advisor_params)
        format.html { redirect_to @advisor, notice: 'Your qualify was successfully sent.' }
        format.json { render :show, status: :ok, location: @advisor }
      else
        format.html { render :edit }
        format.json { render json: @advisor.errors, status: :unprocessable_entity }
      end
    end
  end

   def form_params
    params.permit( :advisor_grade)
  end
end
