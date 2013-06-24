require 'spec_helper'

describe "iti_cust_dest_details/edit" do
  before(:each) do
    @iti_cust_dest_detail = assign(:iti_cust_dest_detail, stub_model(ItiCustDestDetail,
      :cust_iti_detail_id => 1,
      :dest_iti_detail_id => 1,
      :comments => "MyString"
    ))
  end
end
