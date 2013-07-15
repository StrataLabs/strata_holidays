require "spec_helper"

describe CustomersController do
  describe "routing" do

    it "routes to #index" do
      get("account/customers").should route_to("account/customers#index")
    end

    it "routes to #new" do
      get("account/customers/new").should route_to("account/customers#new")
    end

    it "routes to #show" do
      get("account/customers/1").should route_to("account/customers#show", :id => "1")
    end

    it "routes to #edit" do
      get("account/customers/1/edit").should route_to("account/customers#edit", :id => "1")
    end

    it "routes to #create" do
      post("account/customers").should route_to("account/customers#create")
    end

    it "routes to #update" do
      put("account/customers/1").should route_to("account/customers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("account/customers/1").should route_to("account/customers#destroy", :id => "1")
    end

  end
end
