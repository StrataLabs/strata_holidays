require 'spec_helper'

describe "cust_iti_headers/show" do
  before(:each) do
    @cust_iti_header = assign(:cust_iti_header, stub_model(CustItiHeader,
      :cust_iti_name => "Cust Iti Name",
      :iti_type => "Iti Type",
      :vacation_type_id => 1,
      :seasons => "Seasons",
      :duration => 2,
      :no_of_adults => 3,
      :no_of_children => "No Of Children"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cust Iti Name/)
    rendered.should match(/Iti Type/)
    rendered.should match(/1/)
    rendered.should match(/Seasons/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/No Of Children/)
  end
end
