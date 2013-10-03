require 'spec_helper'
describe PoaTypesController do
  before(:each) do
    @poa_type = FactoryGirl.create(:poa_type)
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
      assigns(:poa_types).should eq([@poa_type])
    end
  end

  context "GET show" do
    it "does not allow access without logging in" do
      sign_out @user
      get :show, {:id => @poa_type.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      get :show, {:id => @poa_type.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @poa_type.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @poa_type.to_param}
      assigns(:poa_type).should eq(@poa_type)
    end
  end

  context "POST create" do
    before(:each) do
      @poa_type_params = {
        :description => "MyString1",
        :time_can_be_spent => "MyString",
        :comments => "MyString"
      }
    end
    it "does not allow access without logging in" do
      sign_out @user
      post :create, {:poa_type => @poa_type_params}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      post :create, {:poa_type => @poa_type_params}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:poa_type => @poa_type_params}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:poa_type => @poa_type_params}
      assigns(:poa_type).should be_a(PoaType)
      PoaType.last.description.should == "MyString1"
    end
  end

  context "DELETE destroy" do
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @poa_type.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      delete :destroy, {:id => @poa_type.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @poa_type.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @poa_type.to_param}
      response.should redirect_to(poa_types_path)
      PoaType.all.should == []
    end
  end
end