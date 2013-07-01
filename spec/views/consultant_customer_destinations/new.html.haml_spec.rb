require 'spec_helper'

describe "consultant_customer_destinations/new" do
  before(:each) do
    assign(:consultant_customer_destination, stub_model(ConsultantCustomerDestination,
      :vacation_consultant_id => 1,
      :customer_id => 1,
      :cust_iti_header_id => 1
    ).as_new_record)
  end

  it "renders new consultant_customer_destination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", consultant_customer_destinations_path, "post" do
      assert_select "input#consultant_customer_destination_vacation_consultant_id[name=?]", "consultant_customer_destination[vacation_consultant_id]"
      assert_select "input#consultant_customer_destination_customer_id[name=?]", "consultant_customer_destination[customer_id]"
      assert_select "input#consultant_customer_destination_cust_iti_header_id[name=?]", "consultant_customer_destination[cust_iti_header_id]"
    end
  end
end
