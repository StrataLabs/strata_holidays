require 'spec_helper'

describe "iti_day_details/new" do
  before(:each) do
    assign(:iti_day_detail, stub_model(ItiDayDetail,
      :iti_header_id => 1,
      :day_number => 1,
      :points_of_attraction_id => 1,
      :comments => "MyString"
    ).as_new_record)
  end

  it "renders new iti_day_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", iti_day_details_path, "post" do
      assert_select "input#iti_day_detail_iti_header_id[name=?]", "iti_day_detail[iti_header_id]"
      assert_select "input#iti_day_detail_day_number[name=?]", "iti_day_detail[day_number]"
      assert_select "input#iti_day_detail_points_of_attraction_id[name=?]", "iti_day_detail[points_of_attraction_id]"
      assert_select "input#iti_day_detail_comments[name=?]", "iti_day_detail[comments]"
    end
  end
end
