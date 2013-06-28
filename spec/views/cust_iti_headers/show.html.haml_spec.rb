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
end
