require 'spec_helper'

describe "cust_iti_requests/show" do
  before(:each) do
    @cust_iti_request = assign(:cust_iti_request, stub_model(CustItiRequest,
      :customer_id => 1,
      :dest_type => "Dest Type",
      :destinations => "Destinations",
      :vacation_type_id => 2,
      :no_of_adults => 3,
      :no_of_children => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Dest Type/)
    rendered.should match(/Destinations/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
