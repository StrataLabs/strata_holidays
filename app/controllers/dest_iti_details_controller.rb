class DestItiDetailsController < ApplicationController
  before_action :set_dest_iti_detail, only: [:show, :edit, :update, :destroy]

  # GET /dest_iti_details
  # GET /dest_iti_details.json
  def index
    @dest_iti_details = DestItiDetail.all
  end

  # GET /dest_iti_details/1
  # GET /dest_iti_details/1.json
  def show
  end

  # GET /dest_iti_details/new
  def new
    @dest_iti_detail = DestItiDetail.new
  end

  # GET /dest_iti_details/1/edit
  def edit
  end

  # POST /dest_iti_details
  # POST /dest_iti_details.json
  def create
    @dest_iti_detail = DestItiDetail.new(dest_iti_detail_params)

    respond_to do |format|
      if @dest_iti_detail.save
        format.html { redirect_to @dest_iti_detail, notice: 'Dest iti detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dest_iti_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @dest_iti_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dest_iti_details/1
  # PATCH/PUT /dest_iti_details/1.json
  def update
    respond_to do |format|
      if @dest_iti_detail.update(dest_iti_detail_params)
        format.html { redirect_to @dest_iti_detail, notice: 'Dest iti detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dest_iti_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dest_iti_details/1
  # DELETE /dest_iti_details/1.json
  def destroy
    @dest_iti_detail.destroy
    respond_to do |format|
      format.html { redirect_to dest_iti_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dest_iti_detail
      @dest_iti_detail = DestItiDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dest_iti_detail_params
      params.require(:dest_iti_detail).permit(:dest_iti_header_id, :day_number, :points_of_attraction_id, :comments)
    end
end
