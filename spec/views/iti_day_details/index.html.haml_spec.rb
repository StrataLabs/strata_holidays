require 'spec_helper'

describe "iti_day_details/index" do
  before(:each) do
    assign(:iti_day_details, [
      stub_model(ItiDayDetail,
        :iti_header_id => 1,
        :day_number => 2,
        :points_of_attraction_id => 3,
        :comments => "Comments"
      ),
      stub_model(ItiDayDetail,
        :iti_header_id => 1,
        :day_number => 2,
        :points_of_attraction_id => 3,
        :comments => "Comments"
      )
    ])
  end
end
