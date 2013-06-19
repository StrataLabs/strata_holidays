require "spec_helper"

describe ItiHeadersController do
  describe "routing" do

    it "routes to #index" do
      get("/iti_headers").should route_to("iti_headers#index")
    end

    it "routes to #new" do
      get("/iti_headers/new").should route_to("iti_headers#new")
    end

    it "routes to #show" do
      get("/iti_headers/1").should route_to("iti_headers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/iti_headers/1/edit").should route_to("iti_headers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/iti_headers").should route_to("iti_headers#create")
    end

    it "routes to #update" do
      put("/iti_headers/1").should route_to("iti_headers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/iti_headers/1").should route_to("iti_headers#destroy", :id => "1")
    end

  end
end
