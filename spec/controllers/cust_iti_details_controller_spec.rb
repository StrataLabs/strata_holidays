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

  context "Customer Feedback" do
    before(:each) do
      @user1 = FactoryGirl.create(:user)
      cust_iti_header = FactoryGirl.create(:cust_iti_header)
      @cust_iti_detail2 = FactoryGirl.create(:cust_iti_detail, :cust_iti_header_id => cust_iti_header.id)
    end
    it "does not allow access without logging in" do
      sign_out @user1
      post :customer_feedback, { :id => @cust_iti_detail2.id }
      response.should redirect_to(user_session_path)
    end

    it "allows everyone" do
      sign_in @user1
      post :customer_feedback, { :id => @cust_iti_detail2.id }
      CustomerFeedback.last.cust_iti_detail_id.should eq(@cust_iti_detail2.id)
      flash[:notice].should == "Thank you for your valuable feedback!"
      @user1.user_type = User::VC
      @user1.save
      sign_out @user1
      sign_in @user1
      post :customer_feedback, { :id => @cust_iti_detail2.id }
      flash[:notice].should == "Feedback already submitted for this destination."
      CustomerFeedback.delete_all
      post :customer_feedback, { :id => @cust_iti_detail2.id }
      CustomerFeedback.last.cust_iti_detail_id.should eq(@cust_iti_detail2.id)
      flash[:notice].should == "Thank you for your valuable feedback!"
      @user1.user_type = 'A'
      @user1.save
      sign_out @user1
      sign_in @user1
      post :customer_feedback, { :id => @cust_iti_detail2.id }
      flash[:notice].should == "Feedback already submitted for this destination."
      CustomerFeedback.delete_all
      post :customer_feedback, { :id => @cust_iti_detail2.id }
      CustomerFeedback.last.cust_iti_detail_id.should eq(@cust_iti_detail2.id)
      flash[:notice].should == "Thank you for your valuable feedback!"
    end
  end
end