class VcRegistrationsController < ApplicationController
  before_action :set_vc_registration, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin_user, only: [:show, :edit, :update, :destroy]
  # GET /vc_registrations
  # GET /vc_registrations.json
  def index
    @vc_registrations = VcRegistration.all
  end

  # GET /vc_registrations/1
  # GET /vc_registrations/1.json
  def show
  end

  # GET /vc_registrations/new
  def new
    @vc_registration = VcRegistration.new
  end

  # GET /vc_registrations/1/edit
  def edit
  end

  # POST /vc_registrations
  # POST /vc_registrations.json
  def create
    @vc_registration = VcRegistration.new(vc_registration_params)

    respond_to do |format|
      if @vc_registration.save
        format.html { redirect_to @vc_registration, notice: 'Vc registration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vc_registration }
      else
        format.html { render action: 'new' }
        format.json { render json: @vc_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vc_registrations/1
  # PATCH/PUT /vc_registrations/1.json
  def update
    respond_to do |format|
      if @vc_registration.update(vc_registration_params)
        format.html { redirect_to @vc_registration, notice: 'Vc registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vc_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vc_registrations/1
  # DELETE /vc_registrations/1.json
  def destroy
    @vc_registration.destroy
    respond_to do |format|
      format.html { redirect_to vc_registrations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vc_registration
      @vc_registration = VcRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vc_registration_params
      params.require(:vc_registration).permit(:name, :address_1, :address_2, :city, :state, :preferred_neighborhood, :planning, :booking, :preferred_locations, :lphone, :mphone, :email, :comments, :country)
    end
end