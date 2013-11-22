require 'spec_helper'
describe ConsultantCustomerDestinationsController do
  before(:each) do
    @consultant_customer_destination = FactoryGirl.create(:consultant_customer_destination)
    @user = FactoryGirl.create(:user, :user_type => User::ADMIN)
    sign_in @user
  end
  after(:all) do
    User.delete_all
    Customer.delete_all
    Destination.delete_all
    CustItiHeader.delete_all
  end


  context "GET index" do

    it "does not allow access without logging in" do
      sign_out @user
      get :index
      response.should redirect_to(user_session_path)
    end

    it "allows only admin" do
      session[:user_role] = User::CUSTOMER
      @user.save
      sign_in @user
      get :index
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'V'
      @user.save
      sign_out @user
      sign_in @user
      get :index
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:consultant_customer_destinations).should eq([@consultant_customer_destination])
    end
  end

  context "GET show" do
    it "does not allow access without logging in" do
      sign_out @user
      get :show, {:id => @consultant_customer_destination.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      session[:user_role] = 'V'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @consultant_customer_destination.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'C'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @consultant_customer_destination.to_param}
      assigns(:consultant_customer_destination).should eq(@consultant_customer_destination)
      session[:user_role] = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @consultant_customer_destination.to_param}
      assigns(:consultant_customer_destination).should eq(@consultant_customer_destination)
    end
  end

  context "DELETE destroy" do
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @consultant_customer_destination.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      session[:user_role] = 'V'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @consultant_customer_destination.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'C'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @consultant_customer_destination.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'A'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @consultant_customer_destination.to_param}
      response.should redirect_to(consultant_customer_destinations_path)
      ConsultantCustomerDestination.all.should == []
    end
  end
end