require "spec_helper"

describe VcRegistrationsController do
  describe "routing" do

    it "routes to #index" do
      get("/vc_registrations").should route_to("vc_registrations#index")
    end

    it "routes to #new" do
      get("/vc_registrations/new").should route_to("vc_registrations#new")
    end

    it "routes to #show" do
      get("/vc_registrations/1").should route_to("vc_registrations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vc_registrations/1/edit").should route_to("vc_registrations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vc_registrations").should route_to("vc_registrations#create")
    end

    it "routes to #update" do
      put("/vc_registrations/1").should route_to("vc_registrations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vc_registrations/1").should route_to("vc_registrations#destroy", :id => "1")
    end

  end
end
