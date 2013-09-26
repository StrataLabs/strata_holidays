class ItiDestinationXrefsController < ApplicationController
  before_action :set_iti_destination_xref, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin_user
  # GET /iti_destination_xrefs
  # GET /iti_destination_xrefs.json
  def index
    @iti_destination_xrefs = ItiDestinationXref.all
  end

  # GET /iti_destination_xrefs/1
  # GET /iti_destination_xrefs/1.json
  def show
  end

  # GET /iti_destination_xrefs/new
  def new
    @iti_destination_xref = ItiDestinationXref.new
  end

  # GET /iti_destination_xrefs/1/edit
  def edit
  end

  # POST /iti_destination_xrefs
  # POST /iti_destination_xrefs.json
  def create
    @iti_destination_xref = ItiDestinationXref.new(iti_destination_xref_params)

    respond_to do |format|
      if @iti_destination_xref.save
        format.html { redirect_to @iti_destination_xref, notice: 'Iti destination xref was successfully created.' }
        format.json { render action: 'show', status: :created, location: @iti_destination_xref }
      else
        format.html { render action: 'new' }
        format.json { render json: @iti_destination_xref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iti_destination_xrefs/1
  # PATCH/PUT /iti_destination_xrefs/1.json
  def update
    respond_to do |format|
      if @iti_destination_xref.update(iti_destination_xref_params)
        format.html { redirect_to @iti_destination_xref, notice: 'Iti destination xref was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @iti_destination_xref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iti_destination_xrefs/1
  # DELETE /iti_destination_xrefs/1.json
  def destroy
    @iti_destination_xref.destroy
    respond_to do |format|
      format.html { redirect_to iti_destination_xrefs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iti_destination_xref
      @iti_destination_xref = ItiDestinationXref.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iti_destination_xref_params
      params.require(:iti_destination_xref).permit(:iti_header_id, :destination_id, :destination_group_id, :dest_start_date, :dest_end_date, :season, :duration, :no_of_people)
    end
end
