
class AdvisorsController < ApplicationController
  before_action :set_locale
  before_action :set_advisor, only: [:show, :edit, :update, :destroy, :validate, :accept, :reject]
  before_action :set_student, only: [:show, :edit, :accept, :reject, :validate, :update]

  def set_locale
    I18n.locale = params[:locale].to_sym
  end 
  # GET /advisors
  # GET /advisors.json
  def index
    @advisors = Advisor.all
  end

  # GET /advisors/1
  # GET /advisors/1.json
  def show
    @advisor_state = true
    if current_user.kind == 2
      if @advisor.is_valid == nil
        @advisor_state = nil
      elsif @advisor.is_valid == false
        @advisor_state = false
      end
    end
  end

  def accept
    @advisor.is_valid = true
    @student.is_advisor = true
    update()
  end

  def reject
    @advisor.is_valid = true
    @student.is_advisor = true
    respond_to do |format|
      if @advisor.save
        @student.save
        format.html { redirect_to students_path, notice: 'Student was successfully rejected.' }
        format.json { render :index, status: :created, location: @student }
        
      else
        format.html { render :index }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def validate
    
  end
  
  # GET /advisors/new
  def new
    @advisor = Advisor.new
    @advisor.is_valid = nil
  end

  # GET /advisors/1/edit
  def edit
  end

  def ranking
      @advisors = Advisor.all
  end

  # POST /advisors
  # POST /advisors.json
  def create
    @advisor = Advisor.new(advisor_params)

    respond_to do |format|
      if @advisor.save
        format.html { redirect_to @advisor, notice: 'Advisor was successfully created.' }
        format.json { render :show, status: :created, location: @advisor }
      else
        format.html { render :new }
        format.json { render json: @advisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advisors/1
  # PATCH/PUT /advisors/1.json
  def update
    respond_to do |format|
      if @advisor.update(advisor_params)
        @student.save
        format.html { redirect_to @advisor, notice: 'Advisor was successfully updated.' }
        format.json { render :show, status: :ok, location: @advisor }
      else
        format.html { render :edit }
        format.json { render json: @advisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advisors/1
  # DELETE /advisors/1.json
  def destroy
    @advisor.destroy
    respond_to do |format|
      format.html { redirect_to advisors_url, notice: 'Advisor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_advisor
    @advisor = Advisor.find(params[:id])
  end

  def set_student
    @student = Student.find(@advisor.student_id)
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def advisor_params
      params.require(:advisor).permit(
        :student_id, :is_valid,
        advisor_has_subjects_attributes: [:id, :_destroy, :subject_id]
      ).merge(semester_id: Environment.last.semester.id)
    end
end
