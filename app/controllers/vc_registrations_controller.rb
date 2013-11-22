class VcRegistrationsController < ApplicationController
  before_action :set_vc_registration, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin_user, only: [:edit, :update, :destroy, :index]
  # GET /vc_registrations
  # GET /vc_registrations.json
  def index
    @vc_registrations = VcRegistration.all
  end

  # GET /vc_registrations/1
  # GET /vc_registrations/1.json
  def show
    render :layout => 'unwinders'
  end

  # GET /vc_registrations/new
  def new
    if current_user
      @vc_registration = VcRegistration.new
      render :layout => 'unwinders'
    else
      redirect_to user_session_path
    end
  end

  # GET /vc_registrations/1/edit
  def edit
  end

  # POST /vc_registrations
  # POST /vc_registrations.json
  def create
    if current_user
      unless params[:vc_registration][:preferred_locations].nil?
        params[:vc_registration][:preferred_locations].reject! { |c| c.empty? }
      end
      @vc_registration = VcRegistration.new(vc_registration_params)
      @vc_registration.email = current_user.email
      @vc_registration.name = current_user.name
      @vc_registration.user_id = current_user.id
      respond_to do |format|
        if @vc_registration.save
          Delayed::Job.enqueue VcRegistrationConfirmationJob.new(@vc_registration)
          format.html { redirect_to user_unwinders_path notice: 'Vc registration was successfully created.' }
          format.json { render action: 'show', status: :created, location: @vc_registration }
        else
          format.html { render action: 'new', layout: 'unwinders' }
          format.json { render json: @vc_registration.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to user_session_path
    end
    # render :layout => 'unwinders'
  end

  # PATCH/PUT /vc_registrations/1
  # PATCH/PUT /vc_registrations/1.json
  def update
    unless params[:vc_registration][:preferred_locations].nil?
      params[:vc_registration][:preferred_locations].reject! { |c| c.empty? }
    end
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
      params.require(:vc_registration).permit(:name, :address_1, :address_2, :city, :state, :preferred_neighborhood, :planning, :booking, :lphone, :mphone, :email, :comments, :country, :preferred_locations => [])
    end
end