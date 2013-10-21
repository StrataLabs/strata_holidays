class DestItiHeadersController < ApplicationController
  before_action :set_dest_iti_header, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_user_type_is_vc
  # GET /dest_iti_headers
  # GET /dest_iti_headers.json
  def index
    @dest_iti_headers = DestItiHeader.paginate(:page => params[:page])
  end

  # GET /dest_iti_headers/1
  # GET /dest_iti_headers/1.json
  def show
  end

  # GET /dest_iti_headers/new
  def new
    @dest_iti_header = DestItiHeader.new
  end

  # GET /dest_iti_headers/1/edit
  def edit
  end

  # POST /dest_iti_headers
  # POST /dest_iti_headers.json
  def create
    @dest_iti_header = DestItiHeader.new(dest_iti_header_params)

    respond_to do |format|
      if @dest_iti_header.save
        format.html { redirect_to @dest_iti_header, notice: 'Dest iti header was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dest_iti_header }
      else
        format.html { render action: 'new' }
        format.json { render json: @dest_iti_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dest_iti_headers/1
  # PATCH/PUT /dest_iti_headers/1.json
  def update
    respond_to do |format|
      if @dest_iti_header.update(dest_iti_header_params)
        format.html { redirect_to @dest_iti_header, notice: 'Dest iti header was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dest_iti_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dest_iti_headers/1
  # DELETE /dest_iti_headers/1.json
  def destroy
    @dest_iti_header.destroy
    respond_to do |format|
      format.html { redirect_to dest_iti_headers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dest_iti_header
      @dest_iti_header = DestItiHeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dest_iti_header_params
      params.require(:dest_iti_header).permit(:dest_iti_name, :destination_id, :day_number)
    end
end
