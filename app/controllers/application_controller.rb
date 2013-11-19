class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email , :password, :password_confirmation) }
  end

  def after_sign_in_path_for(resource)
    if current_user.roles.count > 2
     '/choose_role'
    else
      if current_user.has_role? :traveller
        session[:user_role] = User::CUSTOMER
      elsif current_user.has_role? :planner
        session[:user_role] = User::VC
      elsif current_user.has_role? :admin
        session[:user_role] = User::ADMIN
      else
        session[:user_role] = User::DEFAULT
      end
      user_unwinders_path
    end
  end

  def authenticate_admin_user
    authenticate_user!
    if current_user
      if session[:user_role] != User::ADMIN
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

  def confirm_user_type_is_vc
    if current_user
      if session[:user_role] == User::CUSTOMER
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

  def confirm_user_type_is_customer
    if current_user
      if session[:user_role] == User::VC
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
end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end