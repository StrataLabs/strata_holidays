class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_user_type!, only: [:show, :edit, :update, :search_vcs, :assign_vcs]
  before_filter :authenticate_admin_user, except: [:show, :edit, :update]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.paginate(:page => params[:page] || 1)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    id = params[:id]
    @customer = Customer.find(id) unless id.nil?
    @current_user_requests = CustItiRequest.where(:customer_id => current_user.customer.id).order('created_at Desc').paginate(:per_page => 2, :page => params[:page] || 1)
    render :layout => 'unwinders'
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  def confirm_user_type!
    if current_user
      if current_user.user_type == User::VC
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
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :address_1, :address_2, :city, :state, :country, :lphone, :mphone, :email, :comments)
    end
end
