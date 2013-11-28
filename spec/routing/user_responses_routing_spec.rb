require "spec_helper"

describe UserResponsesController do
  describe "routing" do

    it "routes to #index" do
      get("/user_responses").should route_to("user_responses#index")
    end

    it "routes to #new" do
      get("/user_responses/new").should route_to("user_responses#new")
    end

    it "routes to #show" do
      get("/user_responses/1").should route_to("user_responses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_responses/1/edit").should route_to("user_responses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_responses").should route_to("user_responses#create")
    end

    it "routes to #update" do
      put("/user_responses/1").should route_to("user_responses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_responses/1").should route_to("user_responses#destroy", :id => "1")
    end

  end
end
