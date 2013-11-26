class CustItiHeadersController < ApplicationController
  include CustItiHeadersHelper
  require 'cust_iti_header_version'
  require 'cust_iti_detail_version'
  require 'iti_cust_dest_poa_detail_version'

  before_action :set_cust_iti_header, only: [:show, :edit, :update, :destroy, :publish, :customer_view, :edit_state, :earlier_versions, :rebuild_version]
  before_filter :authenticate_admin_user, only: [:index]
  before_filter :confirm_user_type_is_vc, except: [:history, :update, :index, :customer_view, :edit_state, :earlier_versions, :rebuild_version]
  before_filter :confirm_user_type_is_customer, only: [:history, :customer_view, :edit_state]
  # GET /cust_iti_headers
  # GET /cust_iti_headers.json
  def index
    @cust_iti_headers = CustItiHeader.paginate(:page => params[:page] || 1).order('id desc')
  end

  # GET /cust_iti_headers/1
  # GET /cust_iti_headers/1.json
  def show
    if (@cust_iti_header.vacation_consultant_id == current_user.vacation_consultant.id || session[:user_role] == User::ADMIN)
      render :layout => 'unwinders'
    else
      redirect_to user_unwinders_path, :notice => "You do not have the authority to view this page"
    end
  end

  # GET /cust_iti_headers/new
  def new
    vc_assignment = VcAssignment.find(params[:vc_assign_id])
    if (vc_assignment.vacation_consultant.id == current_user.vacation_consultant.id || session[:user_role] == User::ADMIN)
      @cust_iti_header = CustItiHeader.new
      request = vc_assignment.cust_iti_request
      @cust_iti_header.customer_id = request.customer_id
      @cust_iti_header.cust_iti_request_id = request.id
      @cust_iti_header.trip_start_date = request.start_date
      @cust_iti_header.trip_end_date = request.end_date
      @cust_iti_header.vacation_type_id = request.vacation_type_id
      detail = @cust_iti_header.cust_iti_details.build
      render :layout => 'unwinders'
    else
      redirect_to user_unwinders_path, :notice => "This request has not been assigned to you."
    end
  end

  # GET /cust_iti_headers/1/edit
  def edit
    render :layout => 'unwinders'
  end

  # POST /cust_iti_headers
  # POST /cust_iti_headers.json
  def create
    @cust_iti_header = CustItiHeader.new(cust_iti_header_params)
    @cust_iti_header.version = 0
    vc_assignment = VcAssignment.find(params[:vc_assign_id])
    respond_to do |format|
      if @cust_iti_header.save!
        vc_assignment.process!
        vc_assignment.save
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
        if @cust_iti_header.state == "Rejected"
          @cust_iti_header.processEvent('pending')
          @cust_iti_header.save
        end
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
    if current_user.vacation_consultant.id == @cust_iti_header.vacation_consultant_id
      if @cust_iti_header.publish!
        #if @cust_iti_header.version == 1
          Delayed::Job.enqueue ItineraryPublishedNotificationJob.new(@cust_iti_header)
        #end
        redirect_to cust_iti_header_path(@cust_iti_header), :notice => "Successfully Published version"
      else
        redirect_to cust_iti_header_path(@cust_iti_header), :notice => "Something went wrong"
      end
    else
      redirect_to user_unwinders_path, :notice => "Not authorized to view this page."
    end
  end

  def customer_view
    render :layout => 'unwinders'
  end

  def edit_state
    if current_user.customer.id == @cust_iti_header.cust_iti_request.customer_id
      if params[:event] == 'reject'
        @cust_iti_header.paper_trail_event = "Capture"
      end
      if @cust_iti_header.processEvent(params[:event])
        @cust_iti_header.paper_trail_event = nil
        VersionMapper.capture_itinerary_versions(@cust_iti_header)
        Delayed::Job.enqueue CustomerResponseToItineraryJob.new(@cust_iti_header)
        redirect_to customer_view_cust_iti_header_path(@cust_iti_header), :notice => "Itinerary was successfully #{@cust_iti_header.state}!"
      else
        redirect_to customer_view_cust_iti_header_path(@cust_iti_header), :notice => "Something went wrong"
      end
    else
      redirect_to customer_view_cust_iti_header_path(@cust_iti_header), :notice => "You are not authorized to perform this action"
    end
  end

  def earlier_versions
    if current_user
      allow_access = false
      if session[:user_role] == User::ADMIN
        allow_access = true
      elsif session[:user_role] == User::CUSTOMER && @cust_iti_header.cust_iti_request.customer.id == current_user.customer.id
        allow_access = true
      elsif session[:user_role] == User::VC && @cust_iti_header.vacation_consultant_id == current_user.vacation_consultant.id
        allow_access = true
      end
      if allow_access
        @versions = CustItiHeaderVersion.where(:item_id => params[:id], :event => "Capture")
        render :layout => 'unwinders'
      else
        redirect_to user_unwinders_path, :notice => "You do not have the authority to view this page."
      end
    else
      redirect_to user_session_path
    end
  end

  def rebuild_version
    if current_user
      allow_access = false
      if session[:user_role] == User::ADMIN
        allow_access = true
      elsif session[:user_role] == User::CUSTOMER && @cust_iti_header.cust_iti_request.customer.id == current_user.customer.id
        allow_access = true
      elsif session[:user_role] == User::VC && @cust_iti_header.vacation_consultant_id == current_user.vacation_consultant.id
        allow_access = true
      end
      if allow_access
        version = CustItiHeaderVersion.find(params[:version])
        header_version_map = VersionMapper.where(:value => version.id, :modeltype => "CustItiHeader", :model_id => params[:id]).first
        @cust_iti_header = version.reify
        @orig_poa = []
        header_version_map.children.each do |detail_map|
          detail_version_map = VersionMapper.where(:id => detail_map.to_i).first
          detail = CustItiDetailVersion.where(:id => detail_version_map.value).first.reify
          temp = {}
          temp[:detail] = detail
          poas = []
          detail_version_map.children.each do |poa_map|
            poa_version_map = VersionMapper.where(:id => poa_map.to_i).first
            poas << ItiCustDestPoaDetailVersion.where(:id => poa_version_map.value).first.reify
          end
          temp[:poa] = poas
          @orig_poa << temp
        end
          render :layout => 'unwinders'
      else
        redirect_to user_unwinders_path, :notice => "You do not have the authority to view this page."
      end
    else
      redirect_to user_session_path
    end
  end

  private

  def set_cust_iti_header
    @cust_iti_header = CustItiHeader.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cust_iti_header_params
    params.require(:cust_iti_header).permit(:id, :cust_iti_name, :cust_iti_request_id, :state, :customer_id, :iti_type, :vacation_type_id, :trip_start_date, :trip_end_date, :seasons, :duration, :no_of_adults, :no_of_children, :vacation_consultant_id, trip_images_attributes: [:id, :caption, :image], cust_iti_details_attributes: [:id, :_destroy, :destination_id, :destination_group_id, :dest_start_date, :dest_end_date, :property_id, iti_cust_dest_poa_details_attributes: [:id, :_destroy, :points_of_attraction_id, :preferred_time_of_arrival, :preferred_time_of_departure, :day_number]] )
  end
end
