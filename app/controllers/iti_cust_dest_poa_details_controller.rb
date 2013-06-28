class ItiCustDestPoaDetailsController < ApplicationController
  before_action :set_iti_cust_dest_poa_detail, only: [:show, :edit, :update, :destroy]

  # GET /iti_cust_dest_poa_details
  # GET /iti_cust_dest_poa_details.json
  def index
    @iti_cust_dest_poa_details = ItiCustDestPoaDetail.all
  end

  # GET /iti_cust_dest_poa_details/1
  # GET /iti_cust_dest_poa_details/1.json
  def show
  end

  # GET /iti_cust_dest_poa_details/new
  def new
    unless params[:cust_iti_detail_id].nil?
      @cust_iti_det = CustItiDetail.find(params[:cust_iti_detail_id])
      dest_headers = @cust_iti_det.destination.dest_iti_headers.load
      @dest_details = []
      dest_headers.each do |dest_hdr|
        @dest_details << dest_hdr.dest_iti_details
      end
      p @dest_details.flatten!
      # p dest_header.first.dest_iti_details.load
      @dest = @cust_iti_det.destination
      @poa_all = @cust_iti_det.destination.points_of_attractions.load
      @poa = @poa_all.first
      p @poa.dest_iti_details.first.dest_iti_header
      @iti_cust_dest_poa_detail = ItiCustDestPoaDetail.new
    else
      redirect_to cust_iti_details_path
    end
  end

  # GET /iti_cust_dest_poa_details/1/edit
  def edit
  end

  # POST /iti_cust_dest_poa_details
  # POST /iti_cust_dest_poa_details.json
  def create
    temp = []
    cust_iti_detail_id = params["iti_cust_dest_poa_detail"]["cust_iti_detail_id"]
    preferred_time_of_arrival = params["preferred_time_of_arrival"].each_slice(2).to_a
    preferred_time_of_departure = params["preferred_time_of_departure"].each_slice(2).to_a
    params["dest_iti_detail_id"].each_with_index do |arg,i|
      iti_cust_dest_poa_detail = ItiCustDestPoaDetail.new
      iti_cust_dest_poa_detail.cust_iti_detail_id = cust_iti_detail_id
      iti_cust_dest_poa_detail.dest_iti_detail_id = arg.to_i
      iti_cust_dest_poa_detail.points_of_attraction_id = params["points_of_attraction_id"][i]
      iti_cust_dest_poa_detail.preferred_time_of_arrival = preferred_time_of_arrival[i].map{ |k| "#{k}"}.join(":")
      iti_cust_dest_poa_detail.preferred_time_of_departure = preferred_time_of_departure[i].map{ |k| "#{k}"}.join(":")
      iti_cust_dest_poa_detail.day_number = params["day_number"][i]
      iti_cust_dest_poa_detail.save
    end
    respond_to do |format|
      flash.now[:notice] = 'All Details Added successfully'
      format.html { redirect_to iti_cust_dest_poa_details_path, notice: 'All Details Added successfully'}
      format.json { render action: 'show', status: :created, location: iti_cust_dest_poa_detail }
    end
  end

  # PATCH/PUT /iti_cust_dest_poa_details/1
  # PATCH/PUT /iti_cust_dest_poa_details/1.json
  def update
    respond_to do |format|
      if @iti_cust_dest_poa_detail.update(iti_cust_dest_poa_detail_params)
        format.html { redirect_to @iti_cust_dest_poa_detail, notice: 'Iti cust dest poa detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @iti_cust_dest_poa_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iti_cust_dest_poa_details/1
  # DELETE /iti_cust_dest_poa_details/1.json
  def destroy
    @iti_cust_dest_poa_detail.destroy
    respond_to do |format|
      format.html { redirect_to iti_cust_dest_poa_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iti_cust_dest_poa_detail
      @iti_cust_dest_poa_detail = ItiCustDestPoaDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iti_cust_dest_poa_detail_params
      params.require(:iti_cust_dest_poa_detail).permit(:cust_iti_detail_id , :day_number, :cust_iti_detail_id, :dest_iti_detail_id, :points_of_attraction_id, :preferred_time_of_arrival, :preferred_time_of_departure, :comments)
    end
end
