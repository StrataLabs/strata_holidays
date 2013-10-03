module ApplicationHelper

  def authenticate_admin_user
    p "in"
    authenticate_user!
    if current_user
      p "cu"
      if current_user.user_type != User::ADMIN
        "not admin"
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
