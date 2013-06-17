class PointsOfAttractionsController < ApplicationController
  before_action :set_points_of_attraction, only: [:show, :edit, :update, :destroy]

  # GET /points_of_attractions
  # GET /points_of_attractions.json
  def index
    @points_of_attractions = PointsOfAttraction.all
  end

  # GET /points_of_attractions/1
  # GET /points_of_attractions/1.json
  def show
  end

  # GET /points_of_attractions/new
  def new
    @points_of_attraction = PointsOfAttraction.new
  end

  # GET /points_of_attractions/1/edit
  def edit
  end

  # POST /points_of_attractions
  # POST /points_of_attractions.json
  def create
    @points_of_attraction = PointsOfAttraction.new(points_of_attraction_params)

    respond_to do |format|
      if @points_of_attraction.save
        format.html { redirect_to @points_of_attraction, notice: 'Points of attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @points_of_attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @points_of_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points_of_attractions/1
  # PATCH/PUT /points_of_attractions/1.json
  def update
    respond_to do |format|
      if @points_of_attraction.update(points_of_attraction_params)
        format.html { redirect_to @points_of_attraction, notice: 'Points of attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @points_of_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points_of_attractions/1
  # DELETE /points_of_attractions/1.json
  def destroy
    @points_of_attraction.destroy
    respond_to do |format|
      format.html { redirect_to points_of_attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_points_of_attraction
      @points_of_attraction = PointsOfAttraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def points_of_attraction_params
      params.require(:points_of_attraction).permit(:name, :type_id, :comments, :destination_id)
    end
end
