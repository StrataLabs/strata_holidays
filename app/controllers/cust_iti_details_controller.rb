class CustItiDetailsController < ApplicationController
  include Commentable
  before_action :set_cust_iti_detail, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_user_type_is_vc, :except => [:customer_feedback]
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

  def customer_feedback
    if current_user
      @cust_iti_detail = CustItiDetail.find(params[:id])
      cust_iti_header = @cust_iti_detail.cust_iti_header
      if session[:user_role] == User::CUSTOMER
        if cust_iti_header.customer_id != current_user.customer.id
          redirect_to user_unwinders_path
        end
      end
      if @cust_iti_detail.customer_feedback.nil?
        @cust_iti_detail.customer_feedback = CustomerFeedback.build(params)
        if @cust_iti_detail.save
          redirect_to "/cust_iti_headers/#{cust_iti_header.id}/history", :notice => "Thank you for your valuable feedback!"
        end
      else
        redirect_to "/cust_iti_headers/#{cust_iti_header.id}/history", :notice => "Feedback already submitted for this destination."
      end
    else
      redirect_to user_session_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cust_iti_detail
      @cust_iti_detail = CustItiDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cust_iti_detail_params
      params.require(:cust_iti_detail).permit(:cust_iti_header_id, :destination_id, :destination_group_id, :dest_start_date, :dest_end_date, :property_id, iti_cust_dest_poa_details_attributes: [:_destroy, :points_of_attraction_id, :preferred_time_of_arrival, :preferred_time_of_departure, :comments, :day_number])
    end
end
