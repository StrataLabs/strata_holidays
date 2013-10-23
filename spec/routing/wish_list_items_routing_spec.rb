require "spec_helper"

describe WishListItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/wish_list_items").should route_to("wish_list_items#index")
    end

    it "routes to #new" do
      get("/wish_list_items/new").should route_to("wish_list_items#new")
    end

    it "routes to #show" do
      get("/wish_list_items/1").should route_to("wish_list_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wish_list_items/1/edit").should route_to("wish_list_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wish_list_items").should route_to("wish_list_items#create")
    end

    it "routes to #update" do
      put("/wish_list_items/1").should route_to("wish_list_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wish_list_items/1").should route_to("wish_list_items#destroy", :id => "1")
    end

  end
end
