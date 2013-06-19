class ItiDayDetailsController < ApplicationController
  before_action :set_iti_day_detail, only: [:show, :edit, :update, :destroy]

  # GET /iti_day_details
  # GET /iti_day_details.json
  def index
    @iti_day_details = ItiDayDetail.all
  end

  # GET /iti_day_details/1
  # GET /iti_day_details/1.json
  def show
  end

  # GET /iti_day_details/new
  def new
    @iti_day_detail = ItiDayDetail.new
  end

  # GET /iti_day_details/1/edit
  def edit
  end

  # POST /iti_day_details
  # POST /iti_day_details.json
  def create
    @iti_day_detail = ItiDayDetail.new(iti_day_detail_params)

    respond_to do |format|
      if @iti_day_detail.save
        format.html { redirect_to @iti_day_detail, notice: 'Iti day detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @iti_day_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @iti_day_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iti_day_details/1
  # PATCH/PUT /iti_day_details/1.json
  def update
    respond_to do |format|
      if @iti_day_detail.update(iti_day_detail_params)
        format.html { redirect_to @iti_day_detail, notice: 'Iti day detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @iti_day_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iti_day_details/1
  # DELETE /iti_day_details/1.json
  def destroy
    @iti_day_detail.destroy
    respond_to do |format|
      format.html { redirect_to iti_day_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iti_day_detail
      @iti_day_detail = ItiDayDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iti_day_detail_params
      params.require(:iti_day_detail).permit(:iti_header_id, :day_number, :points_of_attraction_id, :start_time, :end_time, :comments)
    end
end
