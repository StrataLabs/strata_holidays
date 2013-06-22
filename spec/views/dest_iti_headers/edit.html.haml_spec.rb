require 'spec_helper'

describe "dest_iti_headers/edit" do
  before(:each) do
    @dest_iti_header = assign(:dest_iti_header, stub_model(DestItiHeader,
      :dest_iti_name => "MyString",
      :destination_id => 1,
      :day_number => 1
    ))
  end
end
