require 'spec_helper'

describe "dest_iti_details/show" do
  before(:each) do
    @dest_iti_detail = assign(:dest_iti_detail, stub_model(DestItiDetail,
      :dest_iti_header_id => 1,
      :day_number => 2,
      :points_of_attraction_id => 3,
      :comments => "Comments"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Comments/)
  end
end
