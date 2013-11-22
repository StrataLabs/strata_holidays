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

describe TestimonialsController do
  before(:each) do
    @testimonial = FactoryGirl.create(:testimonial)
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
      assigns(:testimonials).should == nil
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:testimonials).should == nil
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :index
      assigns(:testimonials).should eq([@testimonial])
    end
  end

  context "GET show" do

    it "does not allow access without logging in" do
      sign_out @user
      get :show, {:id => @testimonial.to_param}
      response.should redirect_to(user_session_path)
    end

    it "allows only admin" do
      sign_in @user
      get :show, {:id => @testimonial.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @testimonial.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = 'A'
      @user.save
      sign_out @user
      sign_in @user
      get :show, {:id => @testimonial.to_param}
      assigns(:testimonial).should eq(@testimonial)
    end
  end

  context "POST create" do
    before(:each) do
      @testimonial_params = {
        :vacation_consultant_id => 1,
        :content => "MyText",
        :customer_id => 1,
      }
    end
    it "does not allow access without logging in" do
      sign_out @user
      post :create, {:testimonial => @testimonial_params}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      post :create, {:testimonial => @testimonial_params}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:testimonial => @testimonial_params}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      post :create, {:testimonial => @testimonial_params}
      assigns(:testimonial).should be_a(Testimonial)
      Testimonial.last.vacation_consultant_id == 1
    end
  end

  context "DELETE destroy" do
    it "does not allow access without logging in" do
      sign_out @user
      delete :destroy, {:id => @testimonial.to_param}
      response.should redirect_to(user_session_path)
    end
    it "allows only admin" do
      sign_in @user
      delete :destroy, {:id => @testimonial.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::VC
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @testimonial.to_param}
      response.should redirect_to(user_unwinders_path)
      session[:user_role] = User::ADMIN
      @user.save
      sign_out @user
      sign_in @user
      delete :destroy, {:id => @testimonial.to_param}
      response.should redirect_to(testimonials_path)
      Testimonial.all.should == []
    end
  # # This should return the minimal set of attributes required to create a valid
  # # Testimonial. As you add validations to Testimonial, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) { { "vacation_consultant_id" => "1" } }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # TestimonialsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

  # describe "GET index" do
  #   it "assigns all testimonials as @testimonials" do
  #     testimonial = Testimonial.create! valid_attributes
  #     get :index, {}, valid_session
  #     assigns(:testimonials).should eq([testimonial])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested testimonial as @testimonial" do
  #     testimonial = Testimonial.create! valid_attributes
  #     get :show, {:id => testimonial.to_param}, valid_session
  #     assigns(:testimonial).should eq(testimonial)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new testimonial as @testimonial" do
  #     get :new, {}, valid_session
  #     assigns(:testimonial).should be_a_new(Testimonial)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested testimonial as @testimonial" do
  #     testimonial = Testimonial.create! valid_attributes
  #     get :edit, {:id => testimonial.to_param}, valid_session
  #     assigns(:testimonial).should eq(testimonial)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Testimonial" do
  #       expect {
  #         post :create, {:testimonial => valid_attributes}, valid_session
  #       }.to change(Testimonial, :count).by(1)
  #     end

  #     it "assigns a newly created testimonial as @testimonial" do
  #       post :create, {:testimonial => valid_attributes}, valid_session
  #       assigns(:testimonial).should be_a(Testimonial)
  #       assigns(:testimonial).should be_persisted
  #     end

  #     it "redirects to the created testimonial" do
  #       post :create, {:testimonial => valid_attributes}, valid_session
  #       response.should redirect_to(Testimonial.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved testimonial as @testimonial" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Testimonial.any_instance.stub(:save).and_return(false)
  #       post :create, {:testimonial => { "vacation_consultant_id" => "invalid value" }}, valid_session
  #       assigns(:testimonial).should be_a_new(Testimonial)
  #     end

  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Testimonial.any_instance.stub(:save).and_return(false)
  #       post :create, {:testimonial => { "vacation_consultant_id" => "invalid value" }}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested testimonial" do
  #       testimonial = Testimonial.create! valid_attributes
  #       # Assuming there are no other testimonials in the database, this
  #       # specifies that the Testimonial created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Testimonial.any_instance.should_receive(:update).with({ "vacation_consultant_id" => "1" })
  #       put :update, {:id => testimonial.to_param, :testimonial => { "vacation_consultant_id" => "1" }}, valid_session
  #     end

  #     it "assigns the requested testimonial as @testimonial" do
  #       testimonial = Testimonial.create! valid_attributes
  #       put :update, {:id => testimonial.to_param, :testimonial => valid_attributes}, valid_session
  #       assigns(:testimonial).should eq(testimonial)
  #     end

  #     it "redirects to the testimonial" do
  #       testimonial = Testimonial.create! valid_attributes
  #       put :update, {:id => testimonial.to_param, :testimonial => valid_attributes}, valid_session
  #       response.should redirect_to(testimonial)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the testimonial as @testimonial" do
  #       testimonial = Testimonial.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Testimonial.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => testimonial.to_param, :testimonial => { "vacation_consultant_id" => "invalid value" }}, valid_session
  #       assigns(:testimonial).should eq(testimonial)
  #     end

  #     it "re-renders the 'edit' template" do
  #       testimonial = Testimonial.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Testimonial.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => testimonial.to_param, :testimonial => { "vacation_consultant_id" => "invalid value" }}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested testimonial" do
  #     testimonial = Testimonial.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => testimonial.to_param}, valid_session
  #     }.to change(Testimonial, :count).by(-1)
  #   end

  #   it "redirects to the testimonials list" do
  #     testimonial = Testimonial.create! valid_attributes
  #     delete :destroy, {:id => testimonial.to_param}, valid_session
  #     response.should redirect_to(testimonials_url)
  #   end
  end

end
