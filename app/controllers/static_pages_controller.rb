class StaticPagesController < ApplicationController
  layout "static_pages"
  include Commentable
  def itinerary
    @cust_iti_details = CustItiHeader.first.cust_iti_details
  end

  def admin
    authenticate_admin_user
  end

  def choose_role
    render :layout => 'unwinders'
  end

  def set_role
    case params[:role]
    when "traveller"
      session[:user_role] = User::CUSTOMER
    when "admin"
      session[:user_role] = User::ADMIN
    when "planner"
      session[:user_role] = User::VC
    end
    redirect_to user_unwinders_path
  end
end

