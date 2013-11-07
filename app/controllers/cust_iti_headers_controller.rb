class CustItiHeadersController < ApplicationController
  before_action :set_cust_iti_header, only: [:show, :edit, :update, :destroy, :publish]
  before_filter :authenticate_admin_user, only: [:index]
  before_filter :confirm_user_type_is_vc, except: [:history, :update, :index]
  before_filter :confirm_user_type_is_customer, only: [:history]
  # GET /cust_iti_headers
  # GET /cust_iti_headers.json
  def index
    @cust_iti_headers = CustItiHeader.paginate(:page => params[:page]).order('id desc')
  end

  # GET /cust_iti_headers/1
  # GET /cust_iti_headers/1.json
  def show
    render :layout => 'unwinders'
  end

  # GET /cust_iti_headers/new
  def new
    @cust_iti_header = CustItiHeader.new
    detail = @cust_iti_header.cust_iti_details.build
    render :layout => 'unwinders'
  end

  # GET /cust_iti_headers/1/edit
  def edit
    render :layout => 'unwinders'
  end

  # POST /cust_iti_headers
  # POST /cust_iti_headers.json
  def create
    @cust_iti_header = CustItiHeader.new(cust_iti_header_params)
    vc_assignment = VcAssignment.find(params[:vc_assign_id])
    @cust_iti_header.cust_iti_request = vc_assignment.cust_iti_request
    respond_to do |format|
      if @cust_iti_header.save
        vc_assignment.status = 'in_process'
        vc_assignment.save
        request = vc_assignment.cust_iti_request
        @cust_iti_header
        format.html { redirect_to @cust_iti_header, notice: 'Cust iti header was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cust_iti_header }
      else
        format.html { render action: 'new', layout: 'unwinders' }
        format.json { render json: @cust_iti_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cust_iti_headers/1
  # PATCH/PUT /cust_iti_headers/1.json
  def update
    respond_to do |format|
      if @cust_iti_header.update!(cust_iti_header_params)
        format.html { redirect_to @cust_iti_header, notice: 'Cust iti header was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', layout: 'unwinders' }
        format.json { render json: @cust_iti_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cust_iti_headers/1
  # DELETE /cust_iti_headers/1.json
  def destroy
    @cust_iti_header.destroy
    respond_to do |format|
      format.html { redirect_to cust_iti_headers_url }
      format.json { head :no_content }
    end
  end

  def history
    @cust_iti_header = CustItiHeader.find(params[:id])
    render :layout => 'unwinders'
  end

  def publish
    if current_user.user_type == User::VC && current_user.vacation_consultant.id == @cust_iti_header.vacation_consultant_id
      if @cust_iti_header.publish!
        @cust_iti_header.save
        redirect_to cust_iti_header_path(@cust_iti_header), :notice => "Successfully Published"
      end
    else
      redirect_to cust_iti_header_path(@cust_iti_header), :notice => "Something went wrong"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cust_iti_header
      @cust_iti_header = CustItiHeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cust_iti_header_params
      params.require(:cust_iti_header).permit(:id, :cust_iti_name, :cust_iti_request_id, :state, :customer_id, :iti_type, :vacation_type_id, :trip_start_date, :trip_end_date, :seasons, :duration, :no_of_adults, :no_of_children, :vacation_consultant_id, trip_images_attributes: [:id, :caption, :image], cust_iti_details_attributes: [:id, :_destroy, :destination_id, :destination_group_id, :dest_start_date, :dest_end_date, :property_id, iti_cust_dest_poa_details_attributes: [:id, :_destroy, :points_of_attraction_id, :preferred_time_of_arrival, :preferred_time_of_departure, :day_number]] )
    end
end
