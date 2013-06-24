require 'spec_helper'

describe "cust_iti_details/index" do
  before(:each) do
    assign(:cust_iti_details, [
      stub_model(CustItiDetail,
        :cust_iti_header_id => 1,
        :destination_id => 2,
        :destination_group_id => 3,
        :property_id => 4
      ),
      stub_model(CustItiDetail,
        :cust_iti_header_id => 1,
        :destination_id => 2,
        :destination_group_id => 3,
        :property_id => 4
      )
    ])
  end

  it "renders a list of cust_iti_details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
