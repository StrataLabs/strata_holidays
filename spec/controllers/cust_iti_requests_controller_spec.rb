require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CustItiRequestsController do

  # This should return the minimal set of attributes required to create a valid
  # CustItiRequest. As you add validations to CustItiRequest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "customer_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CustItiRequestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all cust_iti_requests as @cust_iti_requests" do
      cust_iti_request = CustItiRequest.create! valid_attributes
      get :index, {}, valid_session
      assigns(:cust_iti_requests).should eq([cust_iti_request])
    end
  end

  describe "GET show" do
    it "assigns the requested cust_iti_request as @cust_iti_request" do
      cust_iti_request = CustItiRequest.create! valid_attributes
      get :show, {:id => cust_iti_request.to_param}, valid_session
      assigns(:cust_iti_request).should eq(cust_iti_request)
    end
  end

  describe "GET new" do
    it "assigns a new cust_iti_request as @cust_iti_request" do
      get :new, {}, valid_session
      assigns(:cust_iti_request).should be_a_new(CustItiRequest)
    end
  end

  describe "GET edit" do
    it "assigns the requested cust_iti_request as @cust_iti_request" do
      cust_iti_request = CustItiRequest.create! valid_attributes
      get :edit, {:id => cust_iti_request.to_param}, valid_session
      assigns(:cust_iti_request).should eq(cust_iti_request)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CustItiRequest" do
        expect {
          post :create, {:cust_iti_request => valid_attributes}, valid_session
        }.to change(CustItiRequest, :count).by(1)
      end

      it "assigns a newly created cust_iti_request as @cust_iti_request" do
        post :create, {:cust_iti_request => valid_attributes}, valid_session
        assigns(:cust_iti_request).should be_a(CustItiRequest)
        assigns(:cust_iti_request).should be_persisted
      end

      it "redirects to the created cust_iti_request" do
        post :create, {:cust_iti_request => valid_attributes}, valid_session
        response.should redirect_to(CustItiRequest.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cust_iti_request as @cust_iti_request" do
        # Trigger the behavior that occurs when invalid params are submitted
        CustItiRequest.any_instance.stub(:save).and_return(false)
        post :create, {:cust_iti_request => { "customer_id" => "invalid value" }}, valid_session
        assigns(:cust_iti_request).should be_a_new(CustItiRequest)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CustItiRequest.any_instance.stub(:save).and_return(false)
        post :create, {:cust_iti_request => { "customer_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cust_iti_request" do
        cust_iti_request = CustItiRequest.create! valid_attributes
        # Assuming there are no other cust_iti_requests in the database, this
        # specifies that the CustItiRequest created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CustItiRequest.any_instance.should_receive(:update).with({ "customer_id" => "1" })
        put :update, {:id => cust_iti_request.to_param, :cust_iti_request => { "customer_id" => "1" }}, valid_session
      end

      it "assigns the requested cust_iti_request as @cust_iti_request" do
        cust_iti_request = CustItiRequest.create! valid_attributes
        put :update, {:id => cust_iti_request.to_param, :cust_iti_request => valid_attributes}, valid_session
        assigns(:cust_iti_request).should eq(cust_iti_request)
      end

      it "redirects to the cust_iti_request" do
        cust_iti_request = CustItiRequest.create! valid_attributes
        put :update, {:id => cust_iti_request.to_param, :cust_iti_request => valid_attributes}, valid_session
        response.should redirect_to(cust_iti_request)
      end
    end

    describe "with invalid params" do
      it "assigns the cust_iti_request as @cust_iti_request" do
        cust_iti_request = CustItiRequest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CustItiRequest.any_instance.stub(:save).and_return(false)
        put :update, {:id => cust_iti_request.to_param, :cust_iti_request => { "customer_id" => "invalid value" }}, valid_session
        assigns(:cust_iti_request).should eq(cust_iti_request)
      end

      it "re-renders the 'edit' template" do
        cust_iti_request = CustItiRequest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CustItiRequest.any_instance.stub(:save).and_return(false)
        put :update, {:id => cust_iti_request.to_param, :cust_iti_request => { "customer_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cust_iti_request" do
      cust_iti_request = CustItiRequest.create! valid_attributes
      expect {
        delete :destroy, {:id => cust_iti_request.to_param}, valid_session
      }.to change(CustItiRequest, :count).by(-1)
    end

    it "redirects to the cust_iti_requests list" do
      cust_iti_request = CustItiRequest.create! valid_attributes
      delete :destroy, {:id => cust_iti_request.to_param}, valid_session
      response.should redirect_to(cust_iti_requests_url)
    end
  end

end