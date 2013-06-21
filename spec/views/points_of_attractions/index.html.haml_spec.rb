require 'spec_helper'

describe "points_of_attractions/index" do
  before(:each) do
    assign(:points_of_attractions, [
      stub_model(PointsOfAttraction,
        :destination_id => 1,
        :poa_type_id => 2,
        :name => "Name",
        :comments => "Comments"
      ),
      stub_model(PointsOfAttraction,
        :destination_id => 1,
        :poa_type_id => 2,
        :name => "Name",
        :comments => "Comments"
      )
    ])
  end
end
