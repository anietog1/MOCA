class AdvisorsController < ApplicationController
  before_action :set_advisor, only: [:show, :edit, :update, :destroy, :validate, :accept, :reject]
  before_action :set_student, only: [:show, :edit, :accept, :reject, :validate]
  # GET /advisors
  # GET /advisors.json
  def index
    @advisors = Advisor.all
  end

  # GET /advisors/1
  # GET /advisors/1.json
  def show
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
  end

  # GET /advisors/1/edit
  def edit
  end

  # POST /advisors
  # POST /advisors.json
  def create
    @advisor = Advisor.new(advisor_params)

    respond_to do |format|
      if @advisor.save
        @subjects = subject_params.map { |subject_id| Subject.find(subject_id) }

        @subjects.each do |subject|
          @advisor.subjects << subject
        end

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
    if @advisor.advisor_has_subjects[0] != nil then @subject1 = @advisor.advisor_has_subjects[0].id else @subject1 = -1 end
    if @advisor.advisor_has_subjects[1] != nil then @subject2 = @advisor.advisor_has_subjects[1].id else @subject2 = -1 end
    if @advisor.advisor_has_subjects[2] != nil then @subject3 = @advisor.advisor_has_subjects[2].id else @subject3 = -1 end
    if @advisor.advisor_has_subjects[3] != nil then @subject4 = @advisor.advisor_has_subjects[3].id else @subject4 = -1 end
  end

  def set_student
    @student = Student.find(@advisor.student_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def form_params
    params.require(:advisor).permit(:student_university_code, :semester_id, :subject1_id, :subject2_id, :subject3_id, :subject4_id)
  end

  def advisor_params
    temp = form_params
    student = Student.where(university_code: temp[:student_university_code]).first
    # DIGO QUE NO SE DEBERIA PERMITIR. Verificar que queden guardadas las materias
    { student_id: student.id, semester_id: temp[:semester_id] }
  end

  def subject_params
    temp = form_params
    subject_ids = []
    subject_ids << temp[:subject1_id] unless temp[:subject1_id].nil?
    subject_ids << temp[:subject2_id] unless temp[:subject2_id].nil?
    subject_ids << temp[:subject3_id] unless temp[:subject3_id].nil?
    subject_ids << temp[:subject4_id] unless temp[:subject4_id].nil?
    subject_ids.sort.uniq
  end
end
