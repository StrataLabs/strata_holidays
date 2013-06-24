require 'spec_helper'

describe "cust_iti_details/show" do
  before(:each) do
    @cust_iti_detail = assign(:cust_iti_detail, stub_model(CustItiDetail,
      :cust_iti_header_id => 1,
      :destination_id => 2,
      :destination_group_id => 3,
      :property_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
