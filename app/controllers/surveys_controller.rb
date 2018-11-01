class SurveysController < ApplicationController
  before_action :set_survey, only: :show

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(form_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def advisor_params
    { id: params.permit(:id)[:id] }
    end
    
    def survey_params
      
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:survey).permit(:session_has_student_id, :satisfaction, :contribution, :conditions, :domain, :clarity, :ability, :treat, :method, :fears, :impact, :comments)
    end
end
