require 'spec_helper'

describe "points_of_attractions/edit" do
  before(:each) do
    @points_of_attraction = assign(:points_of_attraction, stub_model(PointsOfAttraction,
      :destination_id => 1,
      :poa_type_id => 1,
      :name => "MyString",
      :comments => "MyString"
    ))
  end
end
