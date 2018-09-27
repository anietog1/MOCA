class UndergraduatesController < ApplicationController
  before_action :set_undergraduate, only: [:show, :edit, :update, :destroy]

  # GET /undergraduates
  # GET /undergraduates.json
  def index
    @undergraduates = Undergraduate.all
  end

  # GET /undergraduates/1
  # GET /undergraduates/1.json
  def show
  end

  # GET /undergraduates/new
  def new
    @undergraduate = Undergraduate.new
  end

  # GET /undergraduates/1/edit
  def edit
  end

  # POST /undergraduates
  # POST /undergraduates.json
  def create
    @undergraduate = Undergraduate.new(undergraduate_params)

    respond_to do |format|
      if @undergraduate.save
        format.html { redirect_to @undergraduate, notice: 'Undergraduate was successfully created.' }
        format.json { render :show, status: :created, location: @undergraduate }
      else
        format.html { render :new }
        format.json { render json: @undergraduate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /undergraduates/1
  # PATCH/PUT /undergraduates/1.json
  def update
    respond_to do |format|
      if @undergraduate.update(undergraduate_params)
        format.html { redirect_to @undergraduate, notice: 'Undergraduate was successfully updated.' }
        format.json { render :show, status: :ok, location: @undergraduate }
      else
        format.html { render :edit }
        format.json { render json: @undergraduate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /undergraduates/1
  # DELETE /undergraduates/1.json
  def destroy
    @undergraduate.destroy
    respond_to do |format|
      format.html { redirect_to undergraduates_url, notice: 'Undergraduate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_undergraduate
      @undergraduate = Undergraduate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def undergraduate_params
      params.require(:undergraduate).permit(:name)
    end
end
