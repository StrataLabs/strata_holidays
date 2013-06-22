require 'spec_helper'

describe "dest_iti_headers/index" do
  before(:each) do
    assign(:dest_iti_headers, [
      stub_model(DestItiHeader,
        :dest_iti_name => "Dest Iti Name",
        :destination_id => 1,
        :day_number => 2
      ),
      stub_model(DestItiHeader,
        :dest_iti_name => "Dest Iti Name",
        :destination_id => 1,
        :day_number => 2
      )
    ])
  end

  it "renders a list of dest_iti_headers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dest Iti Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
