class CustItiHeadersController < ApplicationController
  before_action :set_cust_iti_header, only: [:show, :edit, :update, :destroy]

  # GET /cust_iti_headers
  # GET /cust_iti_headers.json
  def index
    @cust_iti_headers = CustItiHeader.all
  end

  # GET /cust_iti_headers/1
  # GET /cust_iti_headers/1.json
  def show
  end

  # GET /cust_iti_headers/new
  def new
    @cust_iti_header = CustItiHeader.new
  end

  # GET /cust_iti_headers/1/edit
  def edit
  end

  # POST /cust_iti_headers
  # POST /cust_iti_headers.json
  def create
    @cust_iti_header = CustItiHeader.new(cust_iti_header_params)

    respond_to do |format|
      if @cust_iti_header.save
        format.html { redirect_to @cust_iti_header, notice: 'Cust iti header was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cust_iti_header }
      else
        format.html { render action: 'new' }
        format.json { render json: @cust_iti_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cust_iti_headers/1
  # PATCH/PUT /cust_iti_headers/1.json
  def update
    respond_to do |format|
      if @cust_iti_header.update(cust_iti_header_params)
        format.html { redirect_to @cust_iti_header, notice: 'Cust iti header was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cust_iti_header
      @cust_iti_header = CustItiHeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cust_iti_header_params
      params.require(:cust_iti_header).permit(:cust_iti_name, :iti_type, :vacation_type_id, :trip_start_date, :trip_end_date, :seasons, :duration, :no_of_adults, :no_of_children)
    end
end