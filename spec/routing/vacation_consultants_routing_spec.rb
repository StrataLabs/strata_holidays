require "spec_helper"

describe VacationConsultantsController do
  describe "routing" do

    it "routes to #index" do
      get("/vacation_consultants").should route_to("vacation_consultants#index")
    end

    it "routes to #new" do
      get("/vacation_consultants/new").should route_to("vacation_consultants#new")
    end

    it "routes to #show" do
      get("/vacation_consultants/1").should route_to("vacation_consultants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vacation_consultants/1/edit").should route_to("vacation_consultants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vacation_consultants").should route_to("vacation_consultants#create")
    end

    it "routes to #update" do
      put("/vacation_consultants/1").should route_to("vacation_consultants#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vacation_consultants/1").should route_to("vacation_consultants#destroy", :id => "1")
    end

  end
end
