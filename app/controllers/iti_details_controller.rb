class ItiDetailsController < ApplicationController
  before_action :set_iti_detail, only: [:show, :edit, :update, :destroy]

  # GET /iti_details
  # GET /iti_details.json
  def index
    if params[:iti_header_id].present?
      @iti_details = ItiDetail.where(:iti_header_id => params[:iti_header_id])
    else
      @iti_details = ItiDetail.all
    end
  end

  # GET /iti_details/1
  # GET /iti_details/1.json
  def show
  end

  # GET /iti_details/new
  def new
    @iti_detail = ItiDetail.new
  end

  # GET /iti_details/1/edit
  def edit
  end

  # POST /iti_details
  # POST /iti_details.json
  def create
    @iti_detail = ItiDetail.new(iti_detail_params)

    respond_to do |format|
      if @iti_detail.save
        format.html { redirect_to @iti_detail, notice: 'Iti detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @iti_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @iti_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iti_details/1
  # PATCH/PUT /iti_details/1.json
  def update
    respond_to do |format|
      if @iti_detail.update(iti_detail_params)
        format.html { redirect_to @iti_detail, notice: 'Iti detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @iti_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iti_details/1
  # DELETE /iti_details/1.json
  def destroy
    @iti_detail.destroy
    respond_to do |format|
      format.html { redirect_to iti_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iti_detail
      @iti_detail = ItiDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iti_detail_params
      params.require(:iti_detail).permit(:iti_header_id, :destination_id, :day_number, :property_id, :iti_date)
    end
end
