class CustItiRequestsController < ApplicationController
  before_action :set_cust_iti_request, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_user_type_is_customer, except: [:index, :destroy, :get_cust_iti_request]
  before_filter :confirm_user_type_is_vc, only: [:get_cust_iti_request]
  before_filter :authenticate_admin_user, only: [:index, :destroy]
  # GET /cust_iti_requests
  # GET /cust_iti_requests.json
  def index
    @cust_iti_requests = CustItiRequest.all
  end

  # GET /cust_iti_requests/1
  # GET /cust_iti_requests/1.json
  def show
    render :layout => 'unwinders'
  end

  # GET /cust_iti_requests/new
  def new
    @cust_iti_request = CustItiRequest.new
    render :layout => 'unwinders'
  end

  # GET /cust_iti_requests/1/edit
  def edit
    render :layout => 'unwinders'
  end

  # POST /cust_iti_requests
  # POST /cust_iti_requests.json
  def create
    unless params[:cust_iti_request][:destinations].nil?
      params[:cust_iti_request][:destinations].reject! { |c| c.empty? }
    end
    params[:cust_iti_request][:no_of_children] = 0 unless params[:cust_iti_request][:no_of_children].present?
    @cust_iti_request = CustItiRequest.new(cust_iti_request_params)
    respond_to do |format|
      if @cust_iti_request.save
        format.html { redirect_to @cust_iti_request, notice: 'Cust iti request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cust_iti_request }
      else
        format.html { render action: 'new', :layout => 'unwinders' }
        # format.html { redirect_to user_unwinders_path(:cust_iti_request => @cust_iti_request.attributes), notice: 'Cust iti request was successfully created.' }
        format.json { render json: @cust_iti_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cust_iti_requests/1
  # PATCH/PUT /cust_iti_requests/1.json
  def update
    unless params[:cust_iti_request][:destinations].nil?
      params[:cust_iti_request][:destinations].reject! { |c| c.empty? }
    end
    respond_to do |format|
      if @cust_iti_request.update(cust_iti_request_params)
        format.html { redirect_to @cust_iti_request, notice: 'Cust iti request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', layout: 'unwinders' }
        format.json { render json: @cust_iti_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cust_iti_requests/1
  # DELETE /cust_iti_requests/1.json
  def destroy
    @cust_iti_request.destroy
    respond_to do |format|
      format.html { redirect_to cust_iti_requests_url }
      format.json { head :no_content }
    end
  end

  def get_cust_iti_request
    @vc_assignment = VcAssignment.find(params[:vc_assign_id])
    @cust_iti_request = @vc_assignment.cust_iti_request
    respond_to do |format|
      format.js
    end
  end

  def request_cart
    session[:request]= [] if session[:request].nil?
    if params[:destination_id]
        @destination = Destination.find(params[:destination_id])
        session[:request] << { :destination_id => @destination.id }
        session[:request] = session[:request].uniq
        logger.info "session => #{session[:request].uniq}"
        @customer_id = params[:customer_id]
    end
    respond_to do |format|
      format.js
      format.html { render :text => @destination}
    end
  end

  # def remove_session
  #   session[:request].delete_if{|key| key[:destination_id].to_s==params[:destination_id].to_s}
  #   render :partial => 'layouts/requests_cart'
  # end

  def request_from_cart
    @cust_iti_request = CustItiRequest.new
    destinations = params[:destination_ids].split(',').flatten!
    # if session[:request] && session[:request].count > 0
    #   session[:request].each do |d|
    #     destinations << d[:destination_id].to_s
    #   end
    # end
    @cust_iti_request.destinations = destinations
    render :layout => 'unwinders'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cust_iti_request
      @cust_iti_request = CustItiRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cust_iti_request_params
      params.require(:cust_iti_request).permit(:customer_id, :dest_type, :vacation_type_id, :start_date, :end_date, :no_of_adults, :no_of_children,  :destinations => [])
    end
end