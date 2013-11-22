require 'spec_helper'

describe Users::RegistrationsController do

  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
    User.delete_all
    Customer.delete_all
  end

  context "POST create" do
    it "builds customer record for user who signs up as traveller" do
      post :create, {:user => {:name => "MyName", :email => "foo@example.com", :password => "password"}, :role => "C"}
      u = User.last
      c = Customer.last
      u.email.should == "foo@example.com"
      u.customer.should be_valid
      u.roles.count.should == 2
      u.roles.pluck(:name).should include("traveller","default")
      c.user_id.should == u.id
    end

    it "redirects to vc_registration for user who signs up as planner" do
      post :create, {:user => {:name => "MyName", :email => "foo@example.com", :password => "password"}, :role => "V"}
      u = User.last
      u.email.should == "foo@example.com"
      u.customer.should == nil
      u.roles.count.should == 1
      u.roles.pluck(:name).should include("default")
      response.should redirect_to(new_vc_registration_path(:user_id => u.id))
    end


    it "builds customer record and redirects to vc_registration for user who signs up as both" do
      post :create, {:user => {:name => "MyName", :email => "foo@example.com", :password => "password"}, :role => "B"}
      u = User.last
      c = Customer.last
      u.email.should == "foo@example.com"
      u.customer.should be_valid
      u.roles.count.should == 2
      u.roles.pluck(:name).should include("traveller","default")
      c.user_id.should == u.id
      response.should redirect_to(new_vc_registration_path(:user_id => u.id))
    end
  end

end