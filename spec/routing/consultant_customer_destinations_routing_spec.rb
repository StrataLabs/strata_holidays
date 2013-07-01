require "spec_helper"

describe ConsultantCustomerDestinationsController do
  describe "routing" do

    it "routes to #index" do
      get("/consultant_customer_destinations").should route_to("consultant_customer_destinations#index")
    end

    it "routes to #new" do
      get("/consultant_customer_destinations/new").should route_to("consultant_customer_destinations#new")
    end

    it "routes to #show" do
      get("/consultant_customer_destinations/1").should route_to("consultant_customer_destinations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/consultant_customer_destinations/1/edit").should route_to("consultant_customer_destinations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/consultant_customer_destinations").should route_to("consultant_customer_destinations#create")
    end

    it "routes to #update" do
      put("/consultant_customer_destinations/1").should route_to("consultant_customer_destinations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/consultant_customer_destinations/1").should route_to("consultant_customer_destinations#destroy", :id => "1")
    end

  end
end
