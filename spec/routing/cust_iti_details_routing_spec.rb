require "spec_helper"

describe CustItiDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/cust_iti_details").should route_to("cust_iti_details#index")
    end

    it "routes to #new" do
      get("/cust_iti_details/new").should route_to("cust_iti_details#new")
    end

    it "routes to #show" do
      get("/cust_iti_details/1").should route_to("cust_iti_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cust_iti_details/1/edit").should route_to("cust_iti_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cust_iti_details").should route_to("cust_iti_details#create")
    end

    it "routes to #update" do
      put("/cust_iti_details/1").should route_to("cust_iti_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cust_iti_details/1").should route_to("cust_iti_details#destroy", :id => "1")
    end

  end
end
