class VacationConsultantsController < ApplicationController
  before_action :set_vacation_consultant, only: [:show, :edit, :update, :destroy]

  # GET /vacation_consultants
  # GET /vacation_consultants.json

  def create_vc
    vc_reg = VcRegistration.find(params[:vc_reg_id])
    vc = VacationConsultant.build_from_vc_reg(vc_reg).save!
    vc_reg.status = "Accepted"
    if vc_reg.save
      redirect_to vacation_consultants_path
    else
      redirect_to vacation_consultants_path, :notice => "we are sorry something went wrong"
    end
  end

  def index
    @body = "list"
    @vacation_consultants = VacationConsultant.paginate(:page => params[:page])
    # render :layout => 'unwinders'
  end

  # GET /vacation_consultants/1
  # GET /vacation_consultants/1.json
  def show
  end

  # GET /vacation_consultants/new
  def new
    @vacation_consultant = VacationConsultant.new
  end

  # GET /vacation_consultants/1/edit
  def edit
  end

  # POST /vacation_consultants
  # POST /vacation_consultants.json
  def create
    @vacation_consultant = VacationConsultant.new(vacation_consultant_params)

    respond_to do |format|
      if @vacation_consultant.save!
        format.html { redirect_to @vacation_consultant, notice: 'Vacation consultant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vacation_consultant }
      else
        format.html { render action: 'new' }
        format.json { render json: @vacation_consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacation_consultants/1
  # PATCH/PUT /vacation_consultants/1.json
  def update
    respond_to do |format|
      if @vacation_consultant.update(vacation_consultant_params)
        format.html { redirect_to @vacation_consultant, notice: 'Vacation consultant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vacation_consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacation_consultants/1
  # DELETE /vacation_consultants/1.json
  def destroy
    @vacation_consultant.destroy
    respond_to do |format|
      format.html { redirect_to vacation_consultants_url }
      format.json { head :no_content }
    end
  end

  def search_vcs
    params[:keyword] ||= ''
    # @vcs = Customer.all
    @vcs_solr_response = VacationConsultant.search_me(params[:keyword])
    @vcs = @vcs_solr_response.results.to_a #searching customer for time-being
    # @vcs = VacationConsultant.where(:name => params[:keyword])
    # render :partial => 'search_vcs'
    # respond_to do |format|
    #   format.text "SHow me"
    # end
    @body_id = "list"
    render :layout => 'unwinders'
  end

  def assign_vcs
    p params
    if params[:vc_ids].present?
      params[:vc_ids].each do |vc|
        VcAssignment.create(:vacation_consultant_id => vc, :cust_iti_request_id => params[:cust_req_id], :status => 'New')
      end
    end
    # redirect_to '/unwinders/user'
    render :text => 'success'
  end

  def search
    respond_to do |format|
      format.js
    end
  end

  def edit_vc_assignment
    new_status = params[:status]
    vc = VcAssignment.find(params[:vc_assign_id])
    vc.status = new_status
    vc.save
    redirect_to "/unwinders/vacation_consultant/#{vc.vacation_consultant.id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation_consultant
      @vacation_consultant = VacationConsultant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacation_consultant_params
      params.require(:vacation_consultant).permit(:name, :address_1, :address_2, :city, :state, :preferred_neighborhood, :planning, :booking, :preferred_locations, :lphone, :mphone, :email, :comments, :country)
    end
end