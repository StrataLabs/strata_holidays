class Users::RegistrationsController < Devise::RegistrationsController

  def create
    user = User.new(user_params)
    if user.save
      user.add_role(:default)
      sign_in(resource_name, user)
      if params[:role] == "C"
        user.add_role(:traveller)
        user.build_customer_record
        respond_with user, :location => after_sign_up_path_for(user)
      elsif params[:role] == "V"
        redirect_to new_vc_registration_path(:user_id => user.id)
      elsif params[:role] == "B"
        user.add_role(:traveller)
        user.build_customer_record
        redirect_to new_vc_registration_path(:user_id => user.id)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end