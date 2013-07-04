require 'spec_helper'

describe "cust_iti_requests/index" do
  before(:each) do
    assign(:cust_iti_requests, [
      stub_model(CustItiRequest,
        :customer_id => 1,
        :dest_type => "Dest Type",
        :destinations => "Destinations",
        :vacation_type_id => 2,
        :no_of_adults => 3,
        :no_of_children => 4
      ),
      stub_model(CustItiRequest,
        :customer_id => 1,
        :dest_type => "Dest Type",
        :destinations => "Destinations",
        :vacation_type_id => 2,
        :no_of_adults => 3,
        :no_of_children => 4
      )
    ])
  end

  it "renders a list of cust_iti_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Dest Type".to_s, :count => 2
    assert_select "tr>td", :text => "Destinations".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
