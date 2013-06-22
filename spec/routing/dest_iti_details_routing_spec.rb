require "spec_helper"

describe DestItiDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/dest_iti_details").should route_to("dest_iti_details#index")
    end

    it "routes to #new" do
      get("/dest_iti_details/new").should route_to("dest_iti_details#new")
    end

    it "routes to #show" do
      get("/dest_iti_details/1").should route_to("dest_iti_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dest_iti_details/1/edit").should route_to("dest_iti_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dest_iti_details").should route_to("dest_iti_details#create")
    end

    it "routes to #update" do
      put("/dest_iti_details/1").should route_to("dest_iti_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dest_iti_details/1").should route_to("dest_iti_details#destroy", :id => "1")
    end

  end
end
