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

describe ConsultantCustomerDestinationsController do

  # This should return the minimal set of attributes required to create a valid
  # ConsultantCustomerDestination. As you add validations to ConsultantCustomerDestination, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.build(:consultant_customer_destination).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ConsultantCustomerDestinationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all consultant_customer_destinations as @consultant_customer_destinations" do
      consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
      get :index, {}, valid_session
      assigns(:consultant_customer_destinations).should eq([consultant_customer_destination])
    end
  end

  describe "GET show" do
    it "assigns the requested consultant_customer_destination as @consultant_customer_destination" do
      consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
      get :show, {:id => consultant_customer_destination.to_param}, valid_session
      assigns(:consultant_customer_destination).should eq(consultant_customer_destination)
    end
  end

  describe "GET new" do
    it "assigns a new consultant_customer_destination as @consultant_customer_destination" do
      get :new, {}, valid_session
      assigns(:consultant_customer_destination).should be_a_new(ConsultantCustomerDestination)
    end
  end

  describe "GET edit" do
    it "assigns the requested consultant_customer_destination as @consultant_customer_destination" do
      consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
      get :edit, {:id => consultant_customer_destination.to_param}, valid_session
      assigns(:consultant_customer_destination).should eq(consultant_customer_destination)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ConsultantCustomerDestination" do
        expect {
          post :create, {:consultant_customer_destination => valid_attributes}, valid_session
        }.to change(ConsultantCustomerDestination, :count).by(1)
      end

      it "assigns a newly created consultant_customer_destination as @consultant_customer_destination" do
        post :create, {:consultant_customer_destination => valid_attributes}, valid_session
        assigns(:consultant_customer_destination).should be_a(ConsultantCustomerDestination)
        assigns(:consultant_customer_destination).should be_persisted
      end

      it "redirects to the created consultant_customer_destination" do
        post :create, {:consultant_customer_destination => valid_attributes}, valid_session
        response.should redirect_to(ConsultantCustomerDestination.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved consultant_customer_destination as @consultant_customer_destination" do
        # Trigger the behavior that occurs when invalid params are submitted
        ConsultantCustomerDestination.any_instance.stub(:save).and_return(false)
        post :create, {:consultant_customer_destination => { "vacation_consultant_id" => "invalid value" }}, valid_session
        assigns(:consultant_customer_destination).should be_a_new(ConsultantCustomerDestination)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ConsultantCustomerDestination.any_instance.stub(:save).and_return(false)
        post :create, {:consultant_customer_destination => { "vacation_consultant_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested consultant_customer_destination" do
        consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
        # Assuming there are no other consultant_customer_destinations in the database, this
        # specifies that the ConsultantCustomerDestination created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ConsultantCustomerDestination.any_instance.should_receive(:update).with({ "vacation_consultant_id" => "1" })
        put :update, {:id => consultant_customer_destination.to_param, :consultant_customer_destination => { "vacation_consultant_id" => "1" }}, valid_session
      end

      it "assigns the requested consultant_customer_destination as @consultant_customer_destination" do
        consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
        put :update, {:id => consultant_customer_destination.to_param, :consultant_customer_destination => valid_attributes}, valid_session
        assigns(:consultant_customer_destination).should eq(consultant_customer_destination)
      end

      it "redirects to the consultant_customer_destination" do
        consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
        put :update, {:id => consultant_customer_destination.to_param, :consultant_customer_destination => valid_attributes}, valid_session
        response.should redirect_to(consultant_customer_destination)
      end
    end

    describe "with invalid params" do
      it "assigns the consultant_customer_destination as @consultant_customer_destination" do
        consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ConsultantCustomerDestination.any_instance.stub(:save).and_return(false)
        put :update, {:id => consultant_customer_destination.to_param, :consultant_customer_destination => { "vacation_consultant_id" => "invalid value" }}, valid_session
        assigns(:consultant_customer_destination).should eq(consultant_customer_destination)
      end

      it "re-renders the 'edit' template" do
        consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ConsultantCustomerDestination.any_instance.stub(:save).and_return(false)
        put :update, {:id => consultant_customer_destination.to_param, :consultant_customer_destination => { "vacation_consultant_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested consultant_customer_destination" do
      consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
      expect {
        delete :destroy, {:id => consultant_customer_destination.to_param}, valid_session
      }.to change(ConsultantCustomerDestination, :count).by(-1)
    end

    it "redirects to the consultant_customer_destinations list" do
      consultant_customer_destination = ConsultantCustomerDestination.create! valid_attributes
      delete :destroy, {:id => consultant_customer_destination.to_param}, valid_session
      response.should redirect_to(consultant_customer_destinations_url)
    end
  end

end