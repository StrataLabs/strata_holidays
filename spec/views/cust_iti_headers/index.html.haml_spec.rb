require 'spec_helper'

describe "cust_iti_headers/index" do
  before(:each) do
    assign(:cust_iti_headers, [
      stub_model(CustItiHeader,
        :cust_iti_name => "Cust Iti Name",
        :iti_type => "Iti Type",
        :vacation_type_id => 1,
        :seasons => "Seasons",
        :duration => 2,
        :no_of_adults => 3,
        :no_of_children => "No Of Children"
      ),
      stub_model(CustItiHeader,
        :cust_iti_name => "Cust Iti Name",
        :iti_type => "Iti Type",
        :vacation_type_id => 1,
        :seasons => "Seasons",
        :duration => 2,
        :no_of_adults => 3,
        :no_of_children => "No Of Children"
      )
    ])
  end

  it "renders a list of cust_iti_headers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cust Iti Name".to_s, :count => 2
    assert_select "tr>td", :text => "Iti Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Seasons".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "No Of Children".to_s, :count => 2
  end
end
