require 'spec_helper'
describe CustomersController do
  include SolrSpecHelper
  before(:all) do
    solr_setup
  end
  before(:each) do
    @user = FactoryGirl.create(:user)
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
      @user.user_type = 'V'
      @user.save
      sign_out @user
      sign_in @user
      get :index
      response.should redirect_to(user_unwinders_path)
      @user.user_type = 'A'
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
      @user.user_type = 'V'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @user.customer.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = 'C'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @user.customer.to_param}
      assigns(:customer).should eq(@user.customer)
      @user.user_type = 'A'
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
      @user.user_type = 'V'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @user.customer.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = 'C'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @user.customer.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = 'A'
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @user.customer.to_param}
      response.should redirect_to(customers_path)
      @user.reload.customer.should == nil
    end
  end
end