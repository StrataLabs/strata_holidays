require 'spec_helper'
describe CustItiDetailsController do
  before(:each) do
    @cust_iti_detail = FactoryGirl.create(:cust_iti_detail)
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

    it "allows only admin and VC" do
      sign_in @user
      get :index
      assigns(:cust_iti_details).should == nil
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:cust_iti_details).should eq([@cust_iti_detail])
      @user.user_type = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:cust_iti_details).should eq([@cust_iti_detail])
    end
  end

  context "GET show" do
    it "does not allow access without logging in" do
      sign_out @user
      get :show, {:id => @cust_iti_detail.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      sign_in @user
      get :show, {:id => @cust_iti_detail.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @cust_iti_detail.to_param}
      assigns(:cust_iti_detail).should eq(@cust_iti_detail)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @cust_iti_detail.to_param}
      assigns(:cust_iti_detail).should eq(@cust_iti_detail)
    end
  end

  context "DELETE destroy" do
    before(:each) do
      @cust_iti_detail2 = FactoryGirl.create(:cust_iti_detail)
    end
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @cust_iti_detail.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      sign_in @user
      delete :destroy, {:id => @cust_iti_detail.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @cust_iti_detail.to_param}
      CustItiDetail.all.should == [@cust_iti_detail2]
      response.should redirect_to(cust_iti_details_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @cust_iti_detail2.to_param}
      response.should redirect_to(cust_iti_details_path)
      CustItiDetail.all.should == []
    end
  end
end