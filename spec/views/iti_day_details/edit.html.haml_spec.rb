require 'spec_helper'

describe "iti_day_details/edit" do
  before(:each) do
    @iti_day_detail = assign(:iti_day_detail, stub_model(ItiDayDetail,
      :iti_header_id => 1,
      :day_number => 1,
      :points_of_attraction_id => 1,
      :comments => "MyString"
    ))
  end
end
