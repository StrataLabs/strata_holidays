require 'spec_helper'

describe "cust_iti_details/index" do
  before(:each) do
    assign(:cust_iti_details, [
      stub_model(CustItiDetail,
        :cust_iti_header_id => 1,
        :destination_id => 2,
        :destination_group_id => 3,
        :property_id => 4
      ),
      stub_model(CustItiDetail,
        :cust_iti_header_id => 1,
        :destination_id => 2,
        :destination_group_id => 3,
        :property_id => 4
      )
    ])
  end
end
