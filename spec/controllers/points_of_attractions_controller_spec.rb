require 'spec_helper'
describe PointsOfAttractionsController do
  before(:each) do
    @points_of_attraction = FactoryGirl.create(:points_of_attraction)
    @user = FactoryGirl.create(:user, :user_type => User::CUSTOMER)
    sign_in @user
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

    it "allows only admin after logging in" do
      sign_in @user
      get :index
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
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
      assigns(:points_of_attractions).should eq([@points_of_attraction])
    end
  end

  context "GET show" do
    it "allows access without logging in" do
      sign_out @user
      get :show, {:id => @points_of_attraction.to_param}
      assigns(:points_of_attraction).should eq(@points_of_attraction)
    end
    it "allows all users after logging in" do
      sign_in @user
      get :show, {:id => @points_of_attraction.to_param}
      assigns(:points_of_attraction).should eq(@points_of_attraction)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @points_of_attraction.to_param}
      assigns(:points_of_attraction).should eq(@points_of_attraction)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @points_of_attraction.to_param}
      assigns(:points_of_attraction).should eq(@points_of_attraction)
    end
  end

  context "POST create" do
    before(:each) do
      @destination = FactoryGirl.create(:destination)
      @poa_type = FactoryGirl.create(:poa_type)
      @points_of_attraction_params = {
        :destination_id => @destination.id,
        :poa_type_id => @poa_type.id,
        :name => "MyString",
        :description => "MyString",
        :comments => "MyString"
      }
    end
    it "does not allow access without logging in" do
      sign_out @user
      post :create, {:points_of_attraction => @points_of_attraction_params}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      post :create, {:points_of_attraction => @points_of_attraction_params}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:points_of_attraction => @points_of_attraction_params}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:points_of_attraction => @points_of_attraction_params}
      assigns(:points_of_attraction).should be_a(PointsOfAttraction)
      PointsOfAttraction.last.destination_id.should == @destination.id
      PointsOfAttraction.last.poa_type_id.should == @poa_type.id
    end
  end

  context "DELETE destroy" do
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @points_of_attraction.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      delete :destroy, {:id => @points_of_attraction.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @points_of_attraction.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @points_of_attraction.to_param}
      response.should redirect_to(points_of_attractions_path)
      PointsOfAttraction.all.should == []
    end
  end
end