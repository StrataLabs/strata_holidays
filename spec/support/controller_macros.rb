module ControllerMacros
  def login_user(user)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      #user = FactoryGirl.build(:user)
      #user.save!
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
    end
  end

  def login(user)
    post user_session_path, :email => user(email), :password => user(password)
  end
end