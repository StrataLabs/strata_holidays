class CustItiHeadersController < ApplicationController
  before_action :set_cust_iti_header, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_user_type, except: [:history]
  # GET /cust_iti_headers
  # GET /cust_iti_headers.json
  def index
    @cust_iti_headers = CustItiHeader.paginate(:page => params[:page])
  end

  # GET /cust_iti_headers/1
  # GET /cust_iti_headers/1.json
  def show
    render :layout => 'unwinders'
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

  def history
    @cust_iti_header = CustItiHeader.find(params[:id])
    render :layout => 'unwinders'
  end

  def confirm_user_type
    if current_user
      if current_user.user_type == User::CUSTOMER
        flash[:error] = "Not authorized to view this page"
        respond_to do |format|
          format.html {redirect_to user_unwinders_path}
          format.xml
        end
      end
    else
      respond_to do |format|
        format.html {redirect_to user_session_path}
        format.xml
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cust_iti_header
      @cust_iti_header = CustItiHeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cust_iti_header_params
      params.require(:cust_iti_header).permit(:cust_iti_name, :customer_id, :iti_type, :vacation_type_id, :trip_start_date, :trip_end_date, :seasons, :duration, :no_of_adults, :no_of_children)
    end
end
