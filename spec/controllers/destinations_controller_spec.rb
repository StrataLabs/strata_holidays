require 'spec_helper'
describe DestinationsController do
  before(:each) do
    @destination = FactoryGirl.create(:destination)
    @user = FactoryGirl.create(:user, :user_type => User::CUSTOMER)
    sign_in @user
  end
  after(:all) do
    User.delete_all
  end

  context "GET index" do

    it "allows access without logging in" do
      sign_out @user
      get :index
      assigns(:destinations).should eq([@destination])
    end

    it "allows all users after logging in" do
      sign_in @user
      get :index
      assigns(:destinations).should eq([@destination])
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:destinations).should eq([@destination])
      @user.user_type = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:destinations).should eq([@destination])
    end
  end

  context "GET show" do
    it "allows access without logging in" do
      sign_out @user
      get :show, {:id => @destination.to_param}
      assigns(:destination).should eq(@destination)
    end
    it "allows all users after logging in" do
      sign_in @user
      get :show, {:id => @destination.to_param}
      assigns(:destination).should eq(@destination)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @destination.to_param}
      assigns(:destination).should eq(@destination)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @destination.to_param}
      assigns(:destination).should eq(@destination)
    end
  end

  context "POST create" do
    before(:each) do
      @destination_params = {
        :name => "MyString",
        :description => "My Description",
        #:image => File.join(Rails.root, 'spec', 'fixtures', 'rails.png')
      }
    end
    it "does not allow access without logging in" do
      sign_out @user
      post :create, {:destination => @destination_params}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      post :create, {:destination => @destination_params}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:destination => @destination_params}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:destination => @destination_params}
      assigns(:destination).should be_a(Destination)
      Destination.last.name.should == "MyString"
    end
  end

  context "DELETE destroy" do
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @destination.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      delete :destroy, {:id => @destination.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @destination.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @destination.to_param}
      response.should redirect_to(destinations_path)
      Destination.all.should == []
    end
  end
end