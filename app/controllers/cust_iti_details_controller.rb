class CustItiDetailsController < ApplicationController
  include Commentable
  before_action :set_cust_iti_detail, only: [:show, :edit, :update, :destroy]

  # GET /cust_iti_details
  # GET /cust_iti_details.json
  def index
    @cust_iti_details = CustItiDetail.paginate(:page => params[:page])
  end

  # GET /cust_iti_details/1
  # GET /cust_iti_details/1.json
  def show
  end

  # GET /cust_iti_details/new
  def new
    @cust_iti_detail = CustItiDetail.new
  end

  # GET /cust_iti_details/1/edit
  def edit
  end

  # POST /cust_iti_details
  # POST /cust_iti_details.json
  def create
    @cust_iti_detail = CustItiDetail.new(cust_iti_detail_params)

    respond_to do |format|
      if @cust_iti_detail.save
        format.html { redirect_to new_iti_cust_dest_poa_detail_path(:cust_iti_detail_id => @cust_iti_detail)}
        # format.html { redirect_to @cust_iti_detail, notice: 'Cust iti detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cust_iti_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @cust_iti_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cust_iti_details/1
  # PATCH/PUT /cust_iti_details/1.json
  def update
    respond_to do |format|
      if @cust_iti_detail.update(cust_iti_detail_params)
        format.html { redirect_to @cust_iti_detail, notice: 'Cust iti detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cust_iti_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cust_iti_details/1
  # DELETE /cust_iti_details/1.json
  def destroy
    @cust_iti_detail.destroy
    respond_to do |format|
      format.html { redirect_to cust_iti_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cust_iti_detail
      @cust_iti_detail = CustItiDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cust_iti_detail_params
      params.require(:cust_iti_detail).permit(:cust_iti_header_id, :destination_id, :destination_group_id, :dest_start_date, :dest_end_date, :property_id)
    end
end
