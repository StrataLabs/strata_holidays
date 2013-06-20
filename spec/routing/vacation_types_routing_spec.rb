require "spec_helper"

describe VacationTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/vacation_types").should route_to("vacation_types#index")
    end

    it "routes to #new" do
      get("/vacation_types/new").should route_to("vacation_types#new")
    end

    it "routes to #show" do
      get("/vacation_types/1").should route_to("vacation_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vacation_types/1/edit").should route_to("vacation_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vacation_types").should route_to("vacation_types#create")
    end

    it "routes to #update" do
      put("/vacation_types/1").should route_to("vacation_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vacation_types/1").should route_to("vacation_types#destroy", :id => "1")
    end

  end
end
