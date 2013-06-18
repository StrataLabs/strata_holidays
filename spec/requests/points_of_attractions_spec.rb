require 'spec_helper'

describe "PointsOfAttractions" do
  describe "GET /points_of_attractions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get points_of_attractions_path
      response.status.should be(200)
    end
  end
end
