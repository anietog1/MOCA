class Applications::AdvisorsController < ApplicationController
  def index
    @advisors = Advisor.where(is_valid: nil)
  end

  def show
    @advisor = Advisor.find(params.permit(:id)[:id])
  end

  def accept
    @advisor = Advisor.find(params.permit(:id)[:id])
    @advisor.is_valid = true
    @advisor.save

    respond_to do |format|
      format.html { redirect_to applications_advisors_url, notice: 'Advisor was successfully accepted.' }
    end
  end

  def reject
    @advisor = Advisor.find(params.permit(:id)[:id])
    @advisor.is_valid = false
    @advisor.save

    respond_to do |format|
      format.html { redirect_to applications_advisors_url, notice: 'Advisor was successfully rejected.' }
    end
  end
end
