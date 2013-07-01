require 'spec_helper'

describe "consultant_customer_destinations/show" do
  before(:each) do
    @consultant_customer_destination = assign(:consultant_customer_destination, stub_model(ConsultantCustomerDestination,
      :vacation_consultant_id => 1,
      :customer_id => 2,
      :cust_iti_header_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
