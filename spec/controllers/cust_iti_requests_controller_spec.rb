require 'spec_helper'

describe CustItiRequestsController do
    before(:each) do
    @cust_iti_request = FactoryGirl.create(:cust_iti_request)
    @user = FactoryGirl.create(:user)
    session[:user_role] = User::CUSTOMER
    sign_in @user
  end
  after(:all) do
    User.delete_all
    Destination.delete_all
    CustItiRequest.delete_all
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
      assigns(:cust_iti_requests).should == nil
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
      assigns(:cust_iti_requests).should eq([@cust_iti_request])
    end
  end

  context "GET show" do
    it "does not allow access without logging in" do
      sign_out @user
      get :show, {:id => @cust_iti_request.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and Customer" do
      sign_in @user
      get :show, {:id => @cust_iti_request.to_param}
      assigns(:cust_iti_request).should eq(@cust_iti_request)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @cust_iti_request.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @cust_iti_request.to_param}
      assigns(:cust_iti_request).should eq(@cust_iti_request)
    end
  end

  context "POST create" do
    before(:each) do
      @customer = FactoryGirl.create(:customer)
      @cust_iti_request_params = {
        :customer_id => 1,
        :dest_type => "MyString",
        :destinations => ["1","2"],
        :vacation_type_id => 1,
        :start_date => "2013-07-04",
        :end_date => "2013-07-04",
        :no_of_adults => 1,
        :no_of_children => 1
      }
    end
    it "does not allow access without logging in" do
      sign_out @user
      post :create, {:cust_iti_request => @cust_iti_request_params}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin and Customer" do
      sign_in @user
      post :create, {:cust_iti_request => @cust_iti_request_params}
      assigns(:cust_iti_request).should be_a(CustItiRequest)
      CustItiRequest.last.customer_id.should == @customer.id
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:cust_iti_request => @cust_iti_request_params}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:cust_iti_request => @cust_iti_request_params}
      assigns(:cust_iti_request).should be_a(CustItiRequest)
      CustItiRequest.last.customer_id.should == @customer.id
    end
  end

  context "DELETE destroy" do
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @cust_iti_request.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      delete :destroy, {:id => @cust_iti_request.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @cust_iti_request.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @cust_iti_request.to_param}
      response.should redirect_to(cust_iti_requests_path)
      CustItiRequest.all.should == []
    end
  end

  context "GET request_cart" do
    before(:each) do
      @destination = FactoryGirl.create(:destination)
      @destination2 = FactoryGirl.create(:destination)
    end

    it "does not allow access without logging in" do
      sign_out @user
      get :request_cart, {:destination_id => @destination.id}
      response.should redirect_to(user_session_path)
    end
    it "adds destination to cart" do
      sign_in @user
      get :request_cart, {:destination_id => @destination.id, :format => 'js'}
      session[:request].should include({:destination_id => @destination.id})
      session[:request].count.should == 1
      get :request_cart, {:destination_id => @destination.id, :format => 'js'}
      session[:request].count.should == 1
      get :request_cart, {:destination_id => @destination2.id, :format => 'js'}
      session[:request].should include({:destination_id => @destination2.id})
      session[:request].count.should == 2
    end
  end

  # context "GET remove_session" do
  #   before(:each) do
  #     @destination = FactoryGirl.create(:destination)
  #     @destination2 = FactoryGirl.create(:destination)
  #   end

  #   it "does not allow access without logging in" do
  #     sign_out @user
  #     get :request_cart, {:destination_id => @destination.id}
  #     response.should redirect_to(user_session_path)
  #   end
  #   it "removes destination from cart" do
  #     sign_in @user
  #     get :request_cart, {:destination_id => @destination.id, :format => 'js'}
  #     get :request_cart, {:destination_id => @destination2.id, :format => 'js'}
  #     session[:request].count.should == 2
  #     get :remove_session, {:destination_id => @destination.id, :format => 'js'}
  #     session[:request].should include({:destination_id => @destination2.id})
  #     session[:request].count.should == 1
  #     get :remove_session, {:destination_id => @destination2.id, :format => 'js'}
  #     session[:request].count.should == 0
  #   end
  # end

  context "GET request_from_cart" do
    before(:each) do
      @destination = FactoryGirl.create(:destination)
      @destination2 = FactoryGirl.create(:destination)
    end

    it "does not allow access without logging in" do
      sign_out @user
      get :request_from_cart, {:destination_id => @destination.id}
      response.should redirect_to(user_session_path)
    end
    it "request from cart" do
      sign_in @user
      get :request_cart, {:destination_id => @destination.id, :format => 'js'}
      get :request_cart, {:destination_id => @destination2.id, :format => 'js'}
      session[:request].count.should == 2
      get :request_from_cart, {:destination_ids => [@destination.id.to_s, @destination2.id.to_s]}
      assigns[:cust_iti_request].destinations.should include(@destination.id.to_s)
      assigns[:cust_iti_request].destinations.should include(@destination2.id.to_s)
    end
  end
end


# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to specify the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator.  If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails.  There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.
# #
# # Compared to earlier versions of this generator, there is very limited use of
# # stubs and message expectations in this spec.  Stubs are only used when there
# # is no simpler way to get a handle on the object needed for the example.
# # Message expectations are only used when there is no simpler way to specify
# # that an instance is receiving a specific message.

# describe VacationConsultantsController do
#   login_user
#   # This should return the minimal set of attributes required to create a valid
#   # VacationConsultant. As you add validations to VacationConsultant, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) { FactoryGirl.build(:vacation_consultant).attributes }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # VacationConsultantsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET index" do
#     it "assigns all vacation_consultants as @vacation_consultants" do
#       vacation_consultant = VacationConsultant.create! valid_attributes
#       get :index, {}, valid_session
#       assigns(:vacation_consultants).should eq([vacation_consultant])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested vacation_consultant as @vacation_consultant" do
#       vacation_consultant = VacationConsultant.create! valid_attributes
#       get :show, {:id => vacation_consultant.to_param}, valid_session
#       assigns(:vacation_consultant).should eq(vacation_consultant)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new vacation_consultant as @vacation_consultant" do
#       get :new, {}, valid_session
#       assigns(:vacation_consultant).should be_a_new(VacationConsultant)
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested vacation_consultant as @vacation_consultant" do
#       vacation_consultant = VacationConsultant.create! valid_attributes
#       get :edit, {:id => vacation_consultant.to_param}, valid_session
#       assigns(:vacation_consultant).should eq(vacation_consultant)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new VacationConsultant" do
#         expect {
#           post :create, {:vacation_consultant => valid_attributes}, valid_session
#         }.to change(VacationConsultant, :count).by(1)
#       end

#       it "assigns a newly created vacation_consultant as @vacation_consultant" do
#         post :create, {:vacation_consultant => valid_attributes}, valid_session
#         assigns(:vacation_consultant).should be_a(VacationConsultant)
#         assigns(:vacation_consultant).should be_persisted
#       end

#       it "redirects to the created vacation_consultant" do
#         post :create, {:vacation_consultant => valid_attributes}, valid_session
#         response.should redirect_to(vacation_consultant_path(VacationConsultant.last))
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested vacation_consultant" do
#         vacation_consultant = VacationConsultant.create! valid_attributes
#         # Assuming there are no other vacation_consultants in the database, this
#         # specifies that the VacationConsultant created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         VacationConsultant.any_instance.should_receive(:update).with({ "name" => "MyString" })
#         put :update, {:id => vacation_consultant.to_param, :vacation_consultant => { "name" => "MyString" }}, valid_session
#       end

#       it "assigns the requested vacation_consultant as @vacation_consultant" do
#         vacation_consultant = VacationConsultant.create! valid_attributes
#         put :update, {:id => vacation_consultant.to_param, :vacation_consultant => valid_attributes}, valid_session
#         assigns(:vacation_consultant).should eq(vacation_consultant)
#       end

#       it "redirects to the vacation_consultant" do
#         vacation_consultant = VacationConsultant.create! valid_attributes
#         put :update, {:id => vacation_consultant.to_param, :vacation_consultant => valid_attributes}, valid_session
#         response.should redirect_to(vacation_consultant_path(vacation_consultant))
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the vacation_consultant as @vacation_consultant" do
#         vacation_consultant = VacationConsultant.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         VacationConsultant.any_instance.stub(:save).and_return(false)
#         put :update, {:id => vacation_consultant.to_param, :vacation_consultant => { "name" => "invalid value" }}, valid_session
#         assigns(:vacation_consultant).should eq(vacation_consultant)
#       end

#       it "re-renders the 'edit' template" do
#         vacation_consultant = VacationConsultant.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         VacationConsultant.any_instance.stub(:save).and_return(false)
#         put :update, {:id => vacation_consultant.to_param, :vacation_consultant => { "name" => "invalid value" }}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested vacation_consultant" do
#       vacation_consultant = VacationConsultant.create! valid_attributes
#       expect {
#         delete :destroy, {:id => vacation_consultant.to_param}, valid_session
#       }.to change(VacationConsultant, :count).by(-1)
#     end

#     it "redirects to the vacation_consultants list" do
#       vacation_consultant = VacationConsultant.create! valid_attributes
#       delete :destroy, {:id => vacation_consultant.to_param}, valid_session
#       response.should redirect_to(vacation_consultants_url)
#     end
#   end

# end