class ItiCustDestDetailsController < ApplicationController
  before_action :set_iti_cust_dest_detail, only: [:show, :edit, :update, :destroy]

  # GET /iti_cust_dest_details
  # GET /iti_cust_dest_details.json
  def index
    @iti_cust_dest_details = ItiCustDestDetail.all
  end

  # GET /iti_cust_dest_details/1
  # GET /iti_cust_dest_details/1.json
  def show
  end

  # GET /iti_cust_dest_details/new
  def new
    @iti_cust_dest_detail = ItiCustDestDetail.new
  end

  # GET /iti_cust_dest_details/1/edit
  def edit
  end

  # POST /iti_cust_dest_details
  # POST /iti_cust_dest_details.json
  def create
    @iti_cust_dest_detail = ItiCustDestDetail.new(iti_cust_dest_detail_params)

    respond_to do |format|
      if @iti_cust_dest_detail.save
        format.html { redirect_to @iti_cust_dest_detail, notice: 'Iti cust dest detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @iti_cust_dest_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @iti_cust_dest_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iti_cust_dest_details/1
  # PATCH/PUT /iti_cust_dest_details/1.json
  def update
    respond_to do |format|
      if @iti_cust_dest_detail.update(iti_cust_dest_detail_params)
        format.html { redirect_to @iti_cust_dest_detail, notice: 'Iti cust dest detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @iti_cust_dest_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iti_cust_dest_details/1
  # DELETE /iti_cust_dest_details/1.json
  def destroy
    @iti_cust_dest_detail.destroy
    respond_to do |format|
      format.html { redirect_to iti_cust_dest_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iti_cust_dest_detail
      @iti_cust_dest_detail = ItiCustDestDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iti_cust_dest_detail_params
      params.require(:iti_cust_dest_detail).permit(:cust_iti_detail_id, :dest_iti_detail_id, :preferred_time_of_arrival, :preferred_time_of_departure, :comments)
    end
end
