require "spec_helper"

describe DestItiHeadersController do
  describe "routing" do

    it "routes to #index" do
      get("/dest_iti_headers").should route_to("dest_iti_headers#index")
    end

    it "routes to #new" do
      get("/dest_iti_headers/new").should route_to("dest_iti_headers#new")
    end

    it "routes to #show" do
      get("/dest_iti_headers/1").should route_to("dest_iti_headers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dest_iti_headers/1/edit").should route_to("dest_iti_headers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dest_iti_headers").should route_to("dest_iti_headers#create")
    end

    it "routes to #update" do
      put("/dest_iti_headers/1").should route_to("dest_iti_headers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dest_iti_headers/1").should route_to("dest_iti_headers#destroy", :id => "1")
    end

  end
end
