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

    it "allows only admin" do
      sign_in @user
      get :index
      assigns(:cust_iti_headers).should == nil
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
      assigns(:cust_iti_headers).should eq([@cust_iti_header])
    end
  end

  context "GET show" do
    it "does not allow access without logging in" do
      sign_out @user
      get :show, {:id => @cust_iti_header.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and correct VC" do
      sign_in @user
      get :show, {:id => @cust_iti_header.to_param}
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      vc = FactoryGirl.create(:vacation_consultant)
      @user.vacation_consultant = vc
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

  context "GET new" do
    before(:each) do
      @cust_iti_request = FactoryGirl.create(:cust_iti_request)
      @vc_assignment = FactoryGirl.create(:vc_assignment, :cust_iti_request_id => @cust_iti_request.id)
      @params = {
        :vc_assign_id => @vc_assignment.id
      }
    end
    it "does not allow access without logging in" do
      sign_out @user
      get :new, @params
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and the correct VC" do
      sign_in @user
      get :new, @params
      response.should redirect_to(user_unwinders_path)
      @user.user_type = User::VC
      vc = FactoryGirl.create(:vacation_consultant, :user_id => @user.id)
      @user.vacation_consultant = vc
      @user.save
      sign_out @user
      sign_in @user
      get :new, @params
      # it allows only the VC assigned to create the header
      assigns(:cust_iti_header).should be_a(CustItiHeader)
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :new, @params
      assigns(:cust_iti_header).should be_a(CustItiHeader)

      user1 = FactoryGirl.create(:user, :user_type => User::VC)

      vc = FactoryGirl.create(:vacation_consultant, :user_id => user1.id)
      user1.vacation_consultant = vc
      user1.save
      sign_out @user
      sign_in user1
      get :new, @params
      response.should redirect_to(user_unwinders_path)
    end
  end


  context "POST create" do
    before(:each) do
      @cust_iti_request = FactoryGirl.create(:cust_iti_request)
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
        :no_of_children => "MyString",
        :cust_iti_request_id => @cust_iti_request.id
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
      vc_assignment1 = FactoryGirl.create(:vc_assignment, :cust_iti_request_id => @cust_iti_request.id)
      post :create, {:cust_iti_header => @cust_iti_header_params, :vc_assign_id => vc_assignment1.id}
      assigns(:cust_iti_header).should be_a(CustItiHeader)
      vc_assignment1.reload.state.should == "InProcess"
      CustItiHeader.last.customer_id.should == @customer.id
      @user.user_type = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      vc_assignment2 = FactoryGirl.create(:vc_assignment, :cust_iti_request_id => @cust_iti_request.id)
      post :create, {:cust_iti_header => @cust_iti_header_params, :vc_assign_id => vc_assignment2.id}
      assigns(:cust_iti_header).should be_a(CustItiHeader)
      vc_assignment2.reload.state.should == "InProcess"
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


  context "POST publish" do
    it "does not allow access without logging in" do
      sign_out @user
      post :publish, {:id => @cust_iti_header.id}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and VC" do
      Delayed::Job.delete_all
      sign_in @user
      post :publish, {:id => @cust_iti_header.id}
      response.should redirect_to(user_unwinders_path)
      vc = FactoryGirl.create(:vacation_consultant)
      @user.user_type = User::VC
      @user.vacation_consultant = vc
      @user.save
      sign_out @user
      sign_in @user
      post :publish, {:id => @cust_iti_header.id}
      response.should redirect_to(user_unwinders_path)

      user1 = FactoryGirl.create(:user, :user_type => User::VC)
      vc1 = FactoryGirl.create(:vacation_consultant, :id => @cust_iti_header.vacation_consultant_id)
      header1 = FactoryGirl.create(:cust_iti_header, :vacation_consultant_id => vc1.id)
      user1.vacation_consultant = vc1
      user1.save
      sign_out @user
      sign_in user1
      post :publish, {:id => header1.id}
      header1.save
      header1.reload.state.should == "Published"
      header1.reload.version.should == 1
      Delayed::Job.all[0].handler.should include("ItineraryPublishedNotificationJob")
    end
  end

  context "POST edit_state" do
    before(:each) do
      vc = FactoryGirl.create(:vacation_consultant)
      @vc_user = FactoryGirl.create(:user, :user_type => User::VC)
      @vc_user.vacation_consultant = vc
      vc.save
      @customer_user = FactoryGirl.create(:user)
      @wrong_customer_user = FactoryGirl.create(:user)
      @cust_iti_request = FactoryGirl.create(:cust_iti_request, :customer_id => @customer_user.customer.id)
      @vc_assignment1 = FactoryGirl.create(:vc_assignment, :cust_iti_request_id => @cust_iti_request.id, :vacation_consultant_id => vc.id, :state => "InProcess")
      @cust_iti_header1 = FactoryGirl.create(:cust_iti_header, :cust_iti_request_id => @cust_iti_request.id, :vacation_consultant_id => vc.id)
    end
    it "does not allow access without logging in" do
      sign_out @user
      post :edit_state, {:id => @cust_iti_header1.id}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and Customer" do
      Delayed::Job.delete_all
      @vc_assignment1.state = "InProcess"
      @vc_assignment1.save
      sign_in @vc_user
      post :edit_state, {:id => @cust_iti_header1.id}
      response.should redirect_to(user_unwinders_path)
      post :publish, {:id => @cust_iti_header1.id}
      @cust_iti_header1.save
      @cust_iti_header1.reload.version.should == 1
      @cust_iti_header1.state.should == "Published"
      sign_out @vc_user

      sign_in @customer_user
      post :edit_state, {:id => @cust_iti_header1.id, :event => 'reject'}
      @cust_iti_header1.save
      @cust_iti_header1.reload.state.should == "Rejected"
      #Delayed::Job.all[0].handler.should include("CustomerResponseToItineraryJob")
      sign_out @customer_user


      sign_in @vc_user
      post :update, {:id => 2, :cust_iti_header => {
        id: 2,
        cust_iti_name: "MyString",
        iti_type: "MyString",
        vacation_type_id: 1,
        trip_start_date: "2013-06-24",
        trip_end_date: "2013-06-24",
        seasons: "MyString",
        duration: 1,
        no_of_adults: 1,
        no_of_children: 0,
        created_at: "2013-11-11 09:55:34",
        updated_at: "2013-11-11 09:55:34",
        customer_id: 1,
        vacation_consultant_id: 1,
        version: 1,
        state: "Rejected",
        cust_iti_request_id: 1
        }}
      @cust_iti_header1.reload.state.should == "Pending"
      post :publish, {:id => @cust_iti_header1.id}
      @cust_iti_header1.reload.state.should == "Published"
      @cust_iti_header1.version.should == 2
      sign_out @vc_user

      sign_in @wrong_customer_user
        post :edit_state, {:id => @cust_iti_header1.id, :event => 'approve'}
        response.should redirect_to(customer_view_cust_iti_header_path)
        flash[:notice].should == "You are not authorized to perform this action"
      sign_out @wrong_customer_user

      sign_in @customer_user
      post :edit_state, {:id => @cust_iti_header1.id, :event => 'approve'}
      @cust_iti_header1.save
      @cust_iti_header1.reload.state.should == "Approved"
      @vc_assignment1.reload.state.should == "Done"
      #Delayed::Job.all[0].handler.should include("CustomerResponseToItineraryJob")
      sign_out @customer_user
    end
  end
end