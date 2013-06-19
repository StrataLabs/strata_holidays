require "spec_helper"

describe ItiDestinationXrefsController do
  describe "routing" do

    it "routes to #index" do
      get("/iti_destination_xrefs").should route_to("iti_destination_xrefs#index")
    end

    it "routes to #new" do
      get("/iti_destination_xrefs/new").should route_to("iti_destination_xrefs#new")
    end

    it "routes to #show" do
      get("/iti_destination_xrefs/1").should route_to("iti_destination_xrefs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/iti_destination_xrefs/1/edit").should route_to("iti_destination_xrefs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/iti_destination_xrefs").should route_to("iti_destination_xrefs#create")
    end

    it "routes to #update" do
      put("/iti_destination_xrefs/1").should route_to("iti_destination_xrefs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/iti_destination_xrefs/1").should route_to("iti_destination_xrefs#destroy", :id => "1")
    end

  end
end
