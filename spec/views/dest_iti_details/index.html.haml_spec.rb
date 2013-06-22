require 'spec_helper'

describe "dest_iti_details/index" do
  before(:each) do
    assign(:dest_iti_details, [
      stub_model(DestItiDetail,
        :dest_iti_header_id => 1,
        :day_number => 2,
        :points_of_attraction_id => 3,
        :comments => "Comments"
      ),
      stub_model(DestItiDetail,
        :dest_iti_header_id => 1,
        :day_number => 2,
        :points_of_attraction_id => 3,
        :comments => "Comments"
      )
    ])
  end
end
