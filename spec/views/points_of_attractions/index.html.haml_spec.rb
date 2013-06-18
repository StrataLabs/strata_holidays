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

  it "renders a list of points_of_attractions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end
