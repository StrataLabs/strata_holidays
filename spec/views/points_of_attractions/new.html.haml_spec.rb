require 'spec_helper'

describe "points_of_attractions/new" do
  before(:each) do
    assign(:points_of_attraction, stub_model(PointsOfAttraction,
      :destination_id => 1,
      :poa_type_id => 1,
      :name => "MyString",
      :comments => "MyString"
    ).as_new_record)
  end

  it "renders new points_of_attraction form" do
    render
  end
end
