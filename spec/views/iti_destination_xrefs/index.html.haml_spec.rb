require 'spec_helper'

describe "iti_destination_xrefs/index" do
  before(:each) do
    assign(:iti_destination_xrefs, [
      stub_model(ItiDestinationXref,
        :iti_header_id => 1,
        :destination_id => 2,
        :destination_group_id => 3,
        :season => "Season",
        :duration => 4,
        :no_of_people => 5
      ),
      stub_model(ItiDestinationXref,
        :iti_header_id => 1,
        :destination_id => 2,
        :destination_group_id => 3,
        :season => "Season",
        :duration => 4,
        :no_of_people => 5
      )
    ])
  end

  it "renders a list of iti_destination_xrefs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Season".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
