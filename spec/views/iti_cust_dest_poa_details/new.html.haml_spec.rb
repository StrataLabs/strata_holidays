require 'spec_helper'

describe "iti_cust_dest_poa_details/new" do
  before(:each) do
    assign(:iti_cust_dest_poa_detail, stub_model(ItiCustDestPoaDetail,
      :cust_iti_detail_id => 1,
      :dest_iti_detail_id => 1,
      :points_of_attraction_id => 1,
      :comments => "MyString"
    ).as_new_record)
  end
end
