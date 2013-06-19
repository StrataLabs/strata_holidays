require "spec_helper"

describe ItiDayDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/iti_day_details").should route_to("iti_day_details#index")
    end

    it "routes to #new" do
      get("/iti_day_details/new").should route_to("iti_day_details#new")
    end

    it "routes to #show" do
      get("/iti_day_details/1").should route_to("iti_day_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/iti_day_details/1/edit").should route_to("iti_day_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/iti_day_details").should route_to("iti_day_details#create")
    end

    it "routes to #update" do
      put("/iti_day_details/1").should route_to("iti_day_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/iti_day_details/1").should route_to("iti_day_details#destroy", :id => "1")
    end

  end
end
