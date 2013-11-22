require 'spec_helper'
describe CustomersController do
  include SolrSpecHelper
  before(:all) do
    solr_setup
  end
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.customer = FactoryGirl.create(:customer)
    @user.vacation_consultant = FactoryGirl.create(:vacation_consultant)
    @user.save
    sign_in @user
  end
  after(:all) do
    User.delete_all
    Customer.delete_all
  end


  context "GET index" do

    it "does not access" do
      sign_out @user
      get :index
      response.should redirect_to(user_session_path)
    end

    it "allows only admin" do
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
      assigns(:customers).should eq([@user.customer])
    end
  end

  context "GET show" do
    it "does not access" do
      sign_out @user
      get :show, {:id => @user.customer.to_param}
      response.should redirect_to(user_session_path)
    end
    it "does not allow VC" do
      sign_in @user
      session[:user_role] = 'V'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @user.customer.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'C'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @user.customer.to_param}
      assigns(:customer).should eq(@user.customer)
      session[:user_role] = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @user.customer.to_param}
      assigns(:customer).should eq(@user.customer)
    end
  end

  context "DELETE destroy" do
    it "does not allow" do
      sign_out @user
      delete :destroy, {:id => @user.customer.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      session[:user_role] = 'V'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @user.customer.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'C'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @user.customer.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'A'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @user.customer.to_param}
      response.should redirect_to(customers_path)
      @user.reload.customer.should == nil
    end
  end
end