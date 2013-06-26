require 'spec_helper'

describe "iti_cust_dest_poa_details/show" do
  before(:each) do
    @iti_cust_dest_poa_detail = assign(:iti_cust_dest_poa_detail, stub_model(ItiCustDestPoaDetail,
      :cust_iti_detail_id => 1,
      :dest_iti_detail_id => 2,
      :points_of_attraction_id => 3,
      :comments => "Comments"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Comments/)
  end
end
