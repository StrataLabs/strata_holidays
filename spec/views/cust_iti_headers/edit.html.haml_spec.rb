require 'spec_helper'

describe "cust_iti_headers/edit" do
  before(:each) do
    @cust_iti_header = assign(:cust_iti_header, stub_model(CustItiHeader,
      :cust_iti_name => "MyString",
      :iti_type => "MyString",
      :vacation_type_id => 1,
      :seasons => "MyString",
      :duration => 1,
      :no_of_adults => 1,
      :no_of_children => "MyString"
    ))
  end
end
