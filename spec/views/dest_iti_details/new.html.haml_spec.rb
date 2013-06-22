require 'spec_helper'

describe "dest_iti_details/new" do
  before(:each) do
    assign(:dest_iti_detail, stub_model(DestItiDetail,
      :dest_iti_header_id => 1,
      :day_number => 1,
      :points_of_attraction_id => 1,
      :comments => "MyString"
    ).as_new_record)
  end
end
