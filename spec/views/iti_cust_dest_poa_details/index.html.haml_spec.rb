require 'spec_helper'

describe "iti_cust_dest_poa_details/index" do
  before(:each) do
    assign(:iti_cust_dest_poa_details, [
      stub_model(ItiCustDestPoaDetail,
        :cust_iti_detail_id => 1,
        :dest_iti_detail_id => 2,
        :points_of_attraction_id => 3,
        :comments => "Comments"
      ),
      stub_model(ItiCustDestPoaDetail,
        :cust_iti_detail_id => 1,
        :dest_iti_detail_id => 2,
        :points_of_attraction_id => 3,
        :comments => "Comments"
      )
    ])
  end
end
