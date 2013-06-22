require 'spec_helper'

describe "dest_iti_headers/new" do
  before(:each) do
    assign(:dest_iti_header, stub_model(DestItiHeader,
      :dest_iti_name => "MyString",
      :destination_id => 1,
      :day_number => 1
    ).as_new_record)
  end
end
