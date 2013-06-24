require 'spec_helper'

describe "dest_iti_details/show" do
  before(:each) do
    @dest_iti_detail = assign(:dest_iti_detail, stub_model(DestItiDetail,
      :dest_iti_header_id => 1,
      :points_of_attraction_id => 3,
      :comments => "Comments"
    ))
  end
end
