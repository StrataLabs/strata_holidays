class UserResponsesController < ApplicationController
  before_action :set_user_response, only: [:show, :edit, :update, :destroy]
  layout 'mauritius'

  # GET /user_responses
  def index
    @user_responses = UserResponse.all
    render :layout => "home"
    # redirect_to new_user_response_path
  end

  # GET /user_responses/1
  def show
    render :layout => "home"
  end

  # GET /user_responses/new
  def new
    @user_response = UserResponse.new
  end

  # GET /user_responses/1/edit
  def edit
  end

  # POST /user_responses
  def create
    @user_response = UserResponse.new(user_response_params)

    if @user_response.save!
      redirect_to '/mauritius', notice: 'Thank you for your request. We will get in touch with you shortly.'
      # redirect_to new_user_response_path, notice: 'Thank you for your request. We will get in touch with you shortly.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /user_responses/1
  def update
    if @user_response.update(user_response_params)
      redirect_to @user_response, notice: 'User response was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /user_responses/1
  def destroy
    @user_response.destroy
    redirect_to user_responses_url, notice: 'User response was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_response
      @user_response = UserResponse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_response_params
      params.require(:user).permit(:name, :email, :contact_no, :start_date, :end_date, :no_of_adults, :no_of_children)
    end
end
