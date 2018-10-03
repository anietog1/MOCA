class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  def accept
    @student.is_valid = true
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
  
  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
        @undergraduate = @student.student_has_undergraduates.first.undergraduate_id
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student.undergraduates << Undergraduate.find(form_params[:undergraduate_id])
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
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
      { first_name: form_params[:first_name],
        middle_name: form_params[:middle_name],
        first_surname: form_params[:first_surname],
        second_surname: form_params[:second_surname],
        university_code: form_params[:university_code],
        university_username: form_params[:university_username],
        mobile_phone: form_params[:mobile_phone] }      
    end

    def form_params
      params.require(:student).permit(:first_name, :middle_name, :first_surname, :second_surname, :university_code, :university_username, :mobile_phone, :is_advisor, :is_valid, :undergraduate_id )
    end
end
