require 'spec_helper'

describe "cust_iti_details/new" do
  before(:each) do
    assign(:cust_iti_detail, stub_model(CustItiDetail,
      :cust_iti_header_id => 1,
      :destination_id => 1,
      :destination_group_id => 1,
      :property_id => 1
    ).as_new_record)
  end
end
