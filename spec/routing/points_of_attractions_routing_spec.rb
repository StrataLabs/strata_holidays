require "spec_helper"

describe PointsOfAttractionsController do
  describe "routing" do

    it "routes to #index" do
      get("/points_of_attractions").should route_to("points_of_attractions#index")
    end

    it "routes to #new" do
      get("/points_of_attractions/new").should route_to("points_of_attractions#new")
    end

    it "routes to #show" do
      get("/points_of_attractions/1").should route_to("points_of_attractions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/points_of_attractions/1/edit").should route_to("points_of_attractions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/points_of_attractions").should route_to("points_of_attractions#create")
    end

    it "routes to #update" do
      put("/points_of_attractions/1").should route_to("points_of_attractions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/points_of_attractions/1").should route_to("points_of_attractions#destroy", :id => "1")
    end

  end
end
