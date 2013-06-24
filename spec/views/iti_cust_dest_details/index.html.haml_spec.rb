require 'spec_helper'

describe "iti_cust_dest_details/index" do
  before(:each) do
    assign(:iti_cust_dest_details, [
      stub_model(ItiCustDestDetail,
        :cust_iti_detail_id => 1,
        :dest_iti_detail_id => 2,
        :comments => "Comments"
      ),
      stub_model(ItiCustDestDetail,
        :cust_iti_detail_id => 1,
        :dest_iti_detail_id => 2,
        :comments => "Comments"
      )
    ])
  end
end
