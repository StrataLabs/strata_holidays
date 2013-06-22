require 'spec_helper'

describe "dest_iti_details/edit" do
  before(:each) do
    @dest_iti_detail = assign(:dest_iti_detail, stub_model(DestItiDetail,
      :dest_iti_header_id => 1,
      :day_number => 1,
      :points_of_attraction_id => 1,
      :comments => "MyString"
    ))
  end
end
