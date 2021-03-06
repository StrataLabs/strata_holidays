class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin_user, except: [:show, :index]
  layout "unwinders"
  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = Destination.order('id desc').paginate(:page => params[:page])
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
    @vcs = @destination.vacation_consultants
    @vcs = VacationConsultant.all.sort_by{rand}[0..2] if !@vcs.present?
  end

  # GET /destinations/new
  def new
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = Destination.new(destination_params)
    # uploader = FileUploader.new
    # # p extn = File.extname(params[:destination][:image_url].original_filename)
    # uploader.store!(params[:destination][:image_url])
    # uploader.url.present? ? @destination.image_url = uploader.url : @destination.image_url  = nil
    respond_to do |format|
      if @destination.save
        format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @destination }
      else
        format.html { render action: 'new' }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    respond_to do |format|
      # uploader = FileUploader.new
      # # p extn = File.extname(params[:destination][:image_url].original_filename)
      # uploader.store!(params[:destination][:image_url])
      # p uploader.url
      # uploader.url.present? ? params[:destination][:image_url] = uploader.url : params[:destination][:image_url] = nil
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      params.require(:destination).permit(:name, :description, :image)
    end
end
