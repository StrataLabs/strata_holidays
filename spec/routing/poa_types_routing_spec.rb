require "spec_helper"

describe PoaTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/poa_types").should route_to("poa_types#index")
    end

    it "routes to #new" do
      get("/poa_types/new").should route_to("poa_types#new")
    end

    it "routes to #show" do
      get("/poa_types/1").should route_to("poa_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/poa_types/1/edit").should route_to("poa_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/poa_types").should route_to("poa_types#create")
    end

    it "routes to #update" do
      put("/poa_types/1").should route_to("poa_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/poa_types/1").should route_to("poa_types#destroy", :id => "1")
    end

  end
end
