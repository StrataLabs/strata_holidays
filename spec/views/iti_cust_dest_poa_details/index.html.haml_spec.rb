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

  it "renders a list of iti_cust_dest_poa_details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end
