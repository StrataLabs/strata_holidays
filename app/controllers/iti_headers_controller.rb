class ItiHeadersController < ApplicationController
  before_action :set_iti_header, only: [:show, :edit, :update, :destroy]

  # GET /iti_headers
  # GET /iti_headers.json
  def index
    @iti_headers = ItiHeader.all
  end

  # GET /iti_headers/1
  # GET /iti_headers/1.json
  def show
  end

  # GET /iti_headers/new
  def new
    if params[:id].present?
      @iti_header = ItiHeader.new(ItiHeader.find(params[:id]).attributes)
    else
      @iti_header = ItiHeader.new
    end
  end

  # GET /iti_headers/1/edit
  def edit
  end

  # POST /iti_headers
  # POST /iti_headers.json
  def create
    @iti_header = ItiHeader.new(iti_header_params)

    respond_to do |format|
      if @iti_header.save
        format.html { redirect_to @iti_header, notice: 'Iti header was successfully created.' }
        format.json { render action: 'show', status: :created, location: @iti_header }
      else
        format.html { render action: 'new' }
        format.json { render json: @iti_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iti_headers/1
  # PATCH/PUT /iti_headers/1.json
  def update
    respond_to do |format|
      if @iti_header.update(iti_header_params)
        format.html { redirect_to @iti_header, notice: 'Iti header was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @iti_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iti_headers/1
  # DELETE /iti_headers/1.json
  def destroy
    @iti_header.destroy
    respond_to do |format|
      format.html { redirect_to iti_headers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iti_header
      @iti_header = ItiHeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iti_header_params
      params.require(:iti_header).permit(:name, :iti_type, :vacation_type_id, :iti_start_date, :iti_end_date, :season, :duration, :no_of_people)
    end
end
