require 'spec_helper'

describe "cust_iti_requests/new" do
  before(:each) do
    assign(:cust_iti_request, stub_model(CustItiRequest,
      :customer_id => 1,
      :dest_type => "MyString",
      :destinations => "MyString",
      :vacation_type_id => 1,
      :no_of_adults => 1,
      :no_of_children => 1
    ).as_new_record)
  end

  it "renders new cust_iti_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cust_iti_requests_path, "post" do
      assert_select "input#cust_iti_request_customer_id[name=?]", "cust_iti_request[customer_id]"
      assert_select "input#cust_iti_request_dest_type[name=?]", "cust_iti_request[dest_type]"
      assert_select "input#cust_iti_request_destinations[name=?]", "cust_iti_request[destinations]"
      assert_select "input#cust_iti_request_vacation_type_id[name=?]", "cust_iti_request[vacation_type_id]"
      assert_select "input#cust_iti_request_no_of_adults[name=?]", "cust_iti_request[no_of_adults]"
      assert_select "input#cust_iti_request_no_of_children[name=?]", "cust_iti_request[no_of_children]"
    end
  end
end
