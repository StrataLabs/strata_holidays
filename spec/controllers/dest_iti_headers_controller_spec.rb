require 'spec_helper'
describe DestItiHeadersController do
  before(:each) do
    @dest_iti_header = FactoryGirl.create(:dest_iti_header)
    @user = FactoryGirl.create(:user)
    sign_in @user
    session[:user_role] = User::CUSTOMER
  end
  after(:all) do
    User.delete_all
  end

  context "GET index" do

    it "does not allow access without logging in" do
      sign_out @user
      get :index
      response.should redirect_to(user_session_path)
    end

    it "allows only admin and VC" do
      sign_in @user
      get :index
      assigns(:dest_iti_headers).should == nil
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:dest_iti_headers).should eq([@dest_iti_header])
      session[:user_role] = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:dest_iti_headers).should eq([@dest_iti_header])
    end
  end

  context "GET show" do
    it "does not allow access without logging in" do
      sign_out @user
      get :show, {:id => @dest_iti_header.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      sign_in @user
      get :show, {:id => @dest_iti_header.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @dest_iti_header.to_param}
      assigns(:dest_iti_header).should eq(@dest_iti_header)
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @dest_iti_header.to_param}
      assigns(:dest_iti_header).should eq(@dest_iti_header)
    end
  end

  context "POST create" do
    before(:each) do
      @customer = FactoryGirl.create(:customer)
      @destination = FactoryGirl.create(:destination)
      @dest_iti_header_params = {
        :dest_iti_name => "MyString",
        :destination_id => @destination.id,
        :day_number => 1
      }
    end
    it "does not allow access without logging in" do
      sign_out @user
      post :create, {:dest_iti_header => @dest_iti_header_params}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      sign_in @user
      post :create, {:dest_iti_header => @dest_iti_header_params}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:dest_iti_header => @dest_iti_header_params}
      assigns(:dest_iti_header).should be_a(DestItiHeader)
      DestItiHeader.last.destination_id.should == @destination.id
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:dest_iti_header => @dest_iti_header_params}
      assigns(:dest_iti_header).should be_a(DestItiHeader)
      DestItiHeader.last.destination_id.should == @destination.id
    end
  end

  context "DELETE destroy" do
    before(:each) do
      @dest_iti_header2 = FactoryGirl.create(:dest_iti_header)
    end
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @dest_iti_header.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      sign_in @user
      delete :destroy, {:id => @dest_iti_header.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @dest_iti_header.to_param}
      DestItiHeader.all.should == [@dest_iti_header2]
      response.should redirect_to(dest_iti_headers_path)
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @dest_iti_header2.to_param}
      response.should redirect_to(dest_iti_headers_path)
      DestItiHeader.all.should == []
    end
  end
end