require 'spec_helper'
describe CustItiHeadersController do
  before(:each) do
    @cust_iti_header = FactoryGirl.create(:cust_iti_header)
    @user = FactoryGirl.create(:user)
    session[:user_role] = User::CUSTOMER
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
      session[:user_role] = User::VC
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
      session[:user_role] = User::VC
      vc = FactoryGirl.create(:vacation_consultant)
      @user.vacation_consultant = vc
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @cust_iti_header.to_param}
      assigns(:cust_iti_header).should eq(@cust_iti_header)
      session[:user_role] = User::ADMIN
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
      session[:user_role] = User::VC
      vc = FactoryGirl.create(:vacation_consultant, :user_id => @user.id)
      @user.vacation_consultant = vc
      @user.save
      sign_out @user
      sign_in @user
      get :new, @params
      # it allows only the VC assigned to create the header
      assigns(:cust_iti_header).should be_a(CustItiHeader)
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :new, @params
      assigns(:cust_iti_header).should be_a(CustItiHeader)

      user1 = FactoryGirl.create(:user)

      vc1 = FactoryGirl.create(:vacation_consultant, :user_id => user1.id)
      user1.vacation_consultant = vc1
      user1.save
      sign_out @user
      session[:user_role] = User::VC
      sign_in user1
      get :new, @params
      response.should redirect_to(user_unwinders_path)
    end
  end


  context "POST create" do
    before(:each) do
      @cust_iti_request = FactoryGirl.create(:cust_iti_request)
      @customer = FactoryGirl.create(:customer, :user_id => @user.id)
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
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      vc_assignment1 = FactoryGirl.create(:vc_assignment, :cust_iti_request_id => @cust_iti_request.id)
      post :create, {:cust_iti_header => @cust_iti_header_params, :vc_assign_id => vc_assignment1.id}
      assigns(:cust_iti_header).should be_a(CustItiHeader)
      vc_assignment1.reload.state.should == "InProcess"
      CustItiHeader.last.customer_id.should == @customer.id
      session[:user_role] = User::ADMIN
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
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @cust_iti_header.to_param}
      CustItiHeader.all.should == [@cust_iti_header2]
      response.should redirect_to(cust_iti_headers_path)
      session[:user_role] = User::ADMIN
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
      session[:user_role] = User::VC
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
      @customer_user.customer = FactoryGirl.create(:customer)
      @customer_user.save

      @wrong_customer_user = FactoryGirl.create(:user)
      @wrong_customer_user.customer = FactoryGirl.create(:customer)
      @wrong_customer_user.save

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
      session[:user_role] = User::VC
      post :edit_state, {:id => @cust_iti_header1.id}
      response.should redirect_to(user_unwinders_path)

      post :publish, {:id => @cust_iti_header1.id}
      @cust_iti_header1.save
      @cust_iti_header1.reload.state.should == "Published"
      sign_out @vc_user

      VersionMapper.delete_all
      sign_in @customer_user
      session[:user_role] = User::CUSTOMER
      post :edit_state, {:id => @cust_iti_header1.id, :event => 'reject'}
      @cust_iti_header1.save
      @cust_iti_header1.reload.state.should == "Rejected"
      VersionMapper.last.modeltype.should == "CustItiHeader"
      VersionMapper.last.model_id.should == @cust_iti_header1.id
      #Delayed::Job.all[0].handler.should include("CustomerResponseToItineraryJob")
      sign_out @customer_user


      sign_in @vc_user
      session[:user_role] = User::VC
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
      #@cust_iti_header1.version.should == 2
      sign_out @vc_user

      sign_in @wrong_customer_user
      session[:user_role] = User::CUSTOMER
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

  context "GET earlier_versions" do
    before(:each) do
      vc = FactoryGirl.create(:vacation_consultant)
      @vc_user = FactoryGirl.create(:user, :user_type => User::VC)
      @vc_user.vacation_consultant = vc
      @vc_user.save

      vc1 = FactoryGirl.create(:vacation_consultant)
      @wrong_vc_user = FactoryGirl.create(:user, :user_type => User::VC)
      @wrong_vc_user.vacation_consultant = vc1
      @wrong_vc_user.save

      @customer_user = FactoryGirl.create(:user)
      @customer_user.customer = FactoryGirl.create(:customer)
      @customer_user.save

      @wrong_customer_user = FactoryGirl.create(:user)
      @wrong_customer_user.customer = FactoryGirl.create(:customer)
      @wrong_customer_user.save

      @cust_iti_request = FactoryGirl.create(:cust_iti_request, :customer_id => @customer_user.customer.id)
      @vc_assignment1 = FactoryGirl.create(:vc_assignment, :cust_iti_request_id => @cust_iti_request.id, :vacation_consultant_id => vc.id, :state => "InProcess")
      @cust_iti_header1 = FactoryGirl.create(:cust_iti_header, :cust_iti_request_id => @cust_iti_request.id, :vacation_consultant_id => vc.id)
    end
    it "does not allow access without logging in" do
      sign_out @user
      session[:user_role] = nil
      get :earlier_versions, {:id => @cust_iti_header1.id}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin, correct Customer and correct VC" do
      @vc_assignment1.state = "InProcess"
      @vc_assignment1.save
      sign_in @vc_user
      session[:user_role] = User::VC
      get :earlier_versions, {:id => @cust_iti_header1.id}
      assigns[:versions].should == []
      CustItiHeaderVersion.where(:item_id => @cust_iti_header1.id).count.should == 1

      post :publish, {:id => @cust_iti_header1.id}
      @cust_iti_header1.save
      #@cust_iti_header1.reload.version.should == 1
      @cust_iti_header1.reload.state.should == "Published"
      CustItiHeaderVersion.where(:item_id => @cust_iti_header1.id).count.should == 2
      sign_out @vc_user

      VersionMapper.delete_all
      sign_in @customer_user
      session[:user_role] = User::CUSTOMER
      post :edit_state, {:id => @cust_iti_header1.id, :event => 'reject'}
      @cust_iti_header1.save
      @cust_iti_header1.reload.state.should == "Rejected"
      VersionMapper.last.modeltype.should == "CustItiHeader"
      VersionMapper.last.model_id.should == @cust_iti_header1.id
      get :earlier_versions, {:id => @cust_iti_header1.id}
      assigns[:versions].count.should == 1
      #Delayed::Job.all[0].handler.should include("CustomerResponseToItineraryJob")
      sign_out @customer_user


      sign_in @vc_user
      session[:user_role] = User::VC
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
      get :earlier_versions, {:id => @cust_iti_header1.id}
      assigns[:versions].count.should == 1
      sign_out @vc_user

      sign_in @wrong_customer_user
      session[:user_role] = User::CUSTOMER
      get :earlier_versions, {:id => @cust_iti_header1.id}
      response.should redirect_to(user_unwinders_path)
      flash[:notice].should == "You do not have the authority to view this page."
      sign_out @wrong_customer_user


      sign_in @wrong_vc_user
      session[:user_role] = User::VC
      get :earlier_versions, {:id => @cust_iti_header1.id}
      response.should redirect_to(user_unwinders_path)
      flash[:notice].should == "You do not have the authority to view this page."
      sign_out @wrong_vc_user
    end
  end

  context "GET rebuild_version" do
    before(:all) do
      CustItiHeaderVersion.delete_all
      CustItiDetailVersion.delete_all
      ItiCustDestPoaDetailVersion.delete_all
    end
    before(:each) do
      vc = FactoryGirl.create(:vacation_consultant)
      @vc_user = FactoryGirl.create(:user, :user_type => User::VC)
      @vc_user.vacation_consultant = vc
      @vc_user.save

      vc1 = FactoryGirl.create(:vacation_consultant)
      @wrong_vc_user = FactoryGirl.create(:user, :user_type => User::VC)
      @wrong_vc_user.vacation_consultant = vc1
      @wrong_vc_user.save

      @customer_user = FactoryGirl.create(:user)
      @customer_user.customer = FactoryGirl.create(:customer)
      @customer_user.save

      @wrong_customer_user = FactoryGirl.create(:user)
      @wrong_customer_user.customer = FactoryGirl.create(:customer)
      @wrong_customer_user.save

      @cust_iti_request = FactoryGirl.create(:cust_iti_request, :customer_id => @customer_user.customer.id)
      @vc_assignment1 = FactoryGirl.create(:vc_assignment, :cust_iti_request_id => @cust_iti_request.id, :vacation_consultant_id => vc.id, :state => "InProcess")
      @cust_iti_header1 = FactoryGirl.create(:cust_iti_header, :cust_iti_request_id => @cust_iti_request.id, :vacation_consultant_id => vc.id)

      @cust_iti_detail = FactoryGirl.create(:cust_iti_detail, :cust_iti_header_id => @cust_iti_header1.id)
      @iti_cust_dest_poa_detail = FactoryGirl.create(:iti_cust_dest_poa_detail, :cust_iti_detail_id => @cust_iti_detail.id)

      @cust_iti_header1.save
      @cust_iti_detail.save
    end
    it "does not allow access without logging in" do
      sign_out @user
      session[:user_role] = nil
      get :rebuild_version, {:id => @cust_iti_header1.id, :version => @cust_iti_header1.versions.last}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and right Customer and right VC" do
      @vc_assignment1.state = "InProcess"
      @vc_assignment1.save

      sign_in @vc_user
      session[:user_role] = User::VC
      post :publish, {:id => @cust_iti_header1.id}
      #@cust_iti_header1.reload.version.should == 1
      @cust_iti_header1.reload.state.should == "Published"
      @cust_iti_header1.versions.length.should == 2
      sign_out @vc_user

      VersionMapper.delete_all
      sign_in @customer_user
      session[:user_role] = User::CUSTOMER
      post :edit_state, {:id => @cust_iti_header1.id, :event => 'reject'}
      @cust_iti_header1.reload.state.should == "Rejected"
      @cust_iti_header1.versions.length.should == 3

      get :rebuild_version, {:id => @cust_iti_header1.id, :version => @cust_iti_header1.versions.last.id}

      reified_header = @cust_iti_header1.versions.last.reify
      assigns[:cust_iti_header].should == reified_header

      result = assigns[:orig_poa].first
      result[:detail].should == @cust_iti_detail.versions.last.reify
      result[:poa].first.should == @iti_cust_dest_poa_detail.versions.last.reify
      sign_out @customer_user


      sign_in @wrong_customer_user
      session[:user_role] = User::CUSTOMER
      get :rebuild_version, {:id => @cust_iti_header1.id, :version => @cust_iti_header1.versions.last.id}
      response.should redirect_to(user_unwinders_path)
      flash[:notice].should == "You do not have the authority to view this page."
      sign_out @wrong_customer_user

      sign_in @wrong_vc_user
      session[:user_role] = User::VC
      get :rebuild_version, {:id => @cust_iti_header1.id, :version => @cust_iti_header1.versions.last.id}
      response.should redirect_to(user_unwinders_path)
      flash[:notice].should == "You do not have the authority to view this page."
      sign_out @wrong_vc_user

    end
  end
end