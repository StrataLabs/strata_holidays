require 'spec_helper'

describe "consultant_customer_destinations/edit" do
  before(:each) do
    @consultant_customer_destination = assign(:consultant_customer_destination, stub_model(ConsultantCustomerDestination,
      :vacation_consultant_id => 1,
      :customer_id => 1,
      :cust_iti_header_id => 1
    ))
  end

  it "renders the edit consultant_customer_destination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", consultant_customer_destination_path(@consultant_customer_destination), "post" do
      assert_select "input#consultant_customer_destination_vacation_consultant_id[name=?]", "consultant_customer_destination[vacation_consultant_id]"
      assert_select "input#consultant_customer_destination_customer_id[name=?]", "consultant_customer_destination[customer_id]"
      assert_select "input#consultant_customer_destination_cust_iti_header_id[name=?]", "consultant_customer_destination[cust_iti_header_id]"
    end
  end
end
