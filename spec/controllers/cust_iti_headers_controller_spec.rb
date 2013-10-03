require 'spec_helper'
describe CustItiHeadersController do
  before(:each) do
    @cust_iti_header = FactoryGirl.create(:cust_iti_header)
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
      assigns(:cust_iti_headers).should == nil
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:cust_iti_headers).should eq([@cust_iti_header])
      @user.user_type = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:cust_iti_headers).should eq([@cust_iti_header])
    end
  end

  context "GET show" do
    it "does not allow access without logging in" do
      sign_out @user
      get :show, {:id => @cust_iti_header.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      sign_in @user
      get :show, {:id => @cust_iti_header.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @cust_iti_header.to_param}
      assigns(:cust_iti_header).should eq(@cust_iti_header)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @cust_iti_header.to_param}
      assigns(:cust_iti_header).should eq(@cust_iti_header)
    end
  end

  context "POST create" do
    before(:each) do
      @customer = FactoryGirl.create(:customer)
      @cust_iti_header_params = {
        :customer_id => @customer.id,
        :cust_iti_name => "MyString",
        :iti_type => "MyString",
        :vacation_type_id => 1,
        :trip_start_date => "2013-06-24",
        :trip_end_date => "2013-06-24",
        :seasons => "MyString",
        :duration => 1,
        :no_of_adults => 1,
        :no_of_children => "MyString"
      }
    end
    it "does not allow access without logging in" do
      sign_out @user
      post :create, {:cust_iti_header => @cust_iti_header_params}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      sign_in @user
      post :create, {:cust_iti_header => @cust_iti_header_params}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:cust_iti_header => @cust_iti_header_params}
      assigns(:cust_iti_header).should be_a(CustItiHeader)
      CustItiHeader.last.customer_id.should == @customer.id
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:cust_iti_header => @cust_iti_header_params}
      assigns(:cust_iti_header).should be_a(CustItiHeader)
      CustItiHeader.last.customer_id.should == @customer.id
    end
  end

  context "DELETE destroy" do
    before(:each) do
      @cust_iti_header2 = FactoryGirl.create(:cust_iti_header)
    end
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @cust_iti_header.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      sign_in @user
      delete :destroy, {:id => @cust_iti_header.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @cust_iti_header.to_param}
      CustItiHeader.all.should == [@cust_iti_header2]
      response.should redirect_to(cust_iti_headers_path)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @cust_iti_header2.to_param}
      response.should redirect_to(cust_iti_headers_path)
      CustItiHeader.all.should == []
    end
  end
end