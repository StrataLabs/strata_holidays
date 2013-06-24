require "spec_helper"

describe CustItiHeadersController do
  describe "routing" do

    it "routes to #index" do
      get("/cust_iti_headers").should route_to("cust_iti_headers#index")
    end

    it "routes to #new" do
      get("/cust_iti_headers/new").should route_to("cust_iti_headers#new")
    end

    it "routes to #show" do
      get("/cust_iti_headers/1").should route_to("cust_iti_headers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cust_iti_headers/1/edit").should route_to("cust_iti_headers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cust_iti_headers").should route_to("cust_iti_headers#create")
    end

    it "routes to #update" do
      put("/cust_iti_headers/1").should route_to("cust_iti_headers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cust_iti_headers/1").should route_to("cust_iti_headers#destroy", :id => "1")
    end

  end
end
