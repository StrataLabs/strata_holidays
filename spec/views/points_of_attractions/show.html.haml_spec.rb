require 'spec_helper'

describe "points_of_attractions/show" do
  before(:each) do
    @points_of_attraction = assign(:points_of_attraction, stub_model(PointsOfAttraction,
      :destination_id => 1,
      :poa_type_id => 2,
      :name => "Name",
      :comments => "Comments"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Name/)
    rendered.should match(/Comments/)
  end
end
