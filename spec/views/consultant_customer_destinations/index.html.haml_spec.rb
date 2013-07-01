require 'spec_helper'

describe "consultant_customer_destinations/index" do
  before(:each) do
    assign(:consultant_customer_destinations, [
      stub_model(ConsultantCustomerDestination,
        :vacation_consultant_id => 1,
        :customer_id => 2,
        :cust_iti_header_id => 3
      ),
      stub_model(ConsultantCustomerDestination,
        :vacation_consultant_id => 1,
        :customer_id => 2,
        :cust_iti_header_id => 3
      )
    ])
  end

  it "renders a list of consultant_customer_destinations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
