require 'spec_helper'

describe "iti_day_details/show" do
  before(:each) do
    @iti_day_detail = assign(:iti_day_detail, stub_model(ItiDayDetail,
      :iti_header_id => 1,
      :day_number => 2,
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
