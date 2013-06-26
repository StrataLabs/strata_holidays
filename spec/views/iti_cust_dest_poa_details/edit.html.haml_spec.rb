require 'spec_helper'

describe "iti_cust_dest_poa_details/edit" do
  before(:each) do
    @iti_cust_dest_poa_detail = assign(:iti_cust_dest_poa_detail, stub_model(ItiCustDestPoaDetail,
      :cust_iti_detail_id => 1,
      :dest_iti_detail_id => 1,
      :points_of_attraction_id => 1,
      :comments => "MyString"
    ))
  end

  it "renders the edit iti_cust_dest_poa_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", iti_cust_dest_poa_detail_path(@iti_cust_dest_poa_detail), "post" do
      assert_select "input#iti_cust_dest_poa_detail_cust_iti_detail_id[name=?]", "iti_cust_dest_poa_detail[cust_iti_detail_id]"
      assert_select "input#iti_cust_dest_poa_detail_dest_iti_detail_id[name=?]", "iti_cust_dest_poa_detail[dest_iti_detail_id]"
      assert_select "input#iti_cust_dest_poa_detail_points_of_attraction_id[name=?]", "iti_cust_dest_poa_detail[points_of_attraction_id]"
      assert_select "input#iti_cust_dest_poa_detail_comments[name=?]", "iti_cust_dest_poa_detail[comments]"
    end
  end
end
