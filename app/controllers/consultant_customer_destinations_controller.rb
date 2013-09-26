class ConsultantCustomerDestinationsController < ApplicationController
  before_action :set_consultant_customer_destination, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin_user

  # GET /consultant_customer_destinations
  # GET /consultant_customer_destinations.json
  def index
    @consultant_customer_destinations = ConsultantCustomerDestination.all
  end

  # GET /consultant_customer_destinations/1
  # GET /consultant_customer_destinations/1.json
  def show
  end

  # GET /consultant_customer_destinations/new
  def new
    @consultant_customer_destination = ConsultantCustomerDestination.new
  end

  # GET /consultant_customer_destinations/1/edit
  def edit
  end

  # POST /consultant_customer_destinations
  # POST /consultant_customer_destinations.json
  def create
    @consultant_customer_destination = ConsultantCustomerDestination.new(consultant_customer_destination_params)

    respond_to do |format|
      if @consultant_customer_destination.save
        format.html { redirect_to @consultant_customer_destination, notice: 'Consultant customer destination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consultant_customer_destination }
      else
        format.html { render action: 'new' }
        format.json { render json: @consultant_customer_destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultant_customer_destinations/1
  # PATCH/PUT /consultant_customer_destinations/1.json
  def update
    respond_to do |format|
      if @consultant_customer_destination.update(consultant_customer_destination_params)
        format.html { redirect_to @consultant_customer_destination, notice: 'Consultant customer destination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consultant_customer_destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultant_customer_destinations/1
  # DELETE /consultant_customer_destinations/1.json
  def destroy
    @consultant_customer_destination.destroy
    respond_to do |format|
      format.html { redirect_to consultant_customer_destinations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultant_customer_destination
      @consultant_customer_destination = ConsultantCustomerDestination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultant_customer_destination_params
      params.require(:consultant_customer_destination).permit(:vacation_consultant_id, :customer_id, :cust_iti_header_id)
    end
end
