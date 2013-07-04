require "spec_helper"

describe CustItiRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/cust_iti_requests").should route_to("cust_iti_requests#index")
    end

    it "routes to #new" do
      get("/cust_iti_requests/new").should route_to("cust_iti_requests#new")
    end

    it "routes to #show" do
      get("/cust_iti_requests/1").should route_to("cust_iti_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cust_iti_requests/1/edit").should route_to("cust_iti_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cust_iti_requests").should route_to("cust_iti_requests#create")
    end

    it "routes to #update" do
      put("/cust_iti_requests/1").should route_to("cust_iti_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cust_iti_requests/1").should route_to("cust_iti_requests#destroy", :id => "1")
    end

  end
end
