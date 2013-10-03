class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email , :password, :password_confirmation) }
  end

  def after_sign_in_path_for(resource)
    if current_user.user_type == User::ADMIN
      "/admin"
    else
      "/unwinders/user"
    end
  end

  def authenticate_admin_user
    authenticate_user!
    if current_user
      if current_user.user_type != User::ADMIN
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


  # def after_sign_out_path_for(resource)
  #   "/home/sign_in"
  # end
end
