class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :validate, :reject, :accept]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  def reject
    @student.is_valid = false
    respond_to do |format|
      if @student.save
        format.html { redirect_to students_path, notice: 'Student was successfully rejected.' }
        format.json { render :index, status: :created, location: @student }
        
      else
        format.html { render :index }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    @student.is_valid = true
    update()
  end
  
  # GET /students/1
  # GET /students/1.json
  def show
    @student_state = true
    if current_user.kind == 2
      if current_user.student.is_valid == nil
        @student_state = nil
      elsif current_user.student.is_valid == false
        @student_state = false
      end
    end
    @undergraduates = @student.student_has_undergraduates
    if current_user.kind == 0 or current_user.kind == 1
      @student = Student.find(params[:id])
    else
      @student = Student.find(current_user.student_id)
    end
    @student_advices = SessionHasStudent.where(student_id: @student.id)
    @advices = []
    @student_advices.each do |sa|
      @advices << Session.find(sa.session_id)
    end
  end

  # GET /students/new
  def new
    @is_user_new = false
    @student = Student.new
    if current_user.kind == 2 and current_user.student_id == nil
      current_user.student_id = @student.id
      current_user.student = @student
    end
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        
    if current_user.kind == 2 and current_user.student_id == nil
      @is_user_new = true
      current_user.student_id = @student.id
      current_user.student = @student
      current_user.save
    end
    format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
        
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end


  def validate
  end
  
  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
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

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(
      :first_name, :middle_name,
      :first_surname, :second_surname,
      :university_code, :university_username,
      :mobile_phone, :is_valid,
      :is_advisor, :advisor_grade,
      student_has_undergraduates_attributes: [:id, :_destroy, :undergraduate_id]
    )
  end
end
