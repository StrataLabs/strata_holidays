require 'spec_helper'

describe "dest_iti_headers/show" do
  before(:each) do
    @dest_iti_header = assign(:dest_iti_header, stub_model(DestItiHeader,
      :dest_iti_name => "Dest Iti Name",
      :destination_id => 1,
      :day_number => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dest Iti Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
