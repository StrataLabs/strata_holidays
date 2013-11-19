module ApplicationHelper

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
end
