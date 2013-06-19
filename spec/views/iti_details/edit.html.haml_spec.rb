require 'spec_helper'

describe "iti_details/edit" do
  before(:each) do
    @iti_detail = assign(:iti_detail, stub_model(ItiDetail,
      :iti_header_id => 1,
      :destination_id => 1,
      :day_number => 1,
      :property_id => 1
    ))
  end

  it "renders the edit iti_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", iti_detail_path(@iti_detail), "post" do
      assert_select "input#iti_detail_iti_header_id[name=?]", "iti_detail[iti_header_id]"
      assert_select "input#iti_detail_destination_id[name=?]", "iti_detail[destination_id]"
      assert_select "input#iti_detail_day_number[name=?]", "iti_detail[day_number]"
      assert_select "input#iti_detail_property_id[name=?]", "iti_detail[property_id]"
    end
  end
end
