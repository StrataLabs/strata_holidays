require 'spec_helper'

describe "dest_iti_headers/index" do
  before(:each) do
    assign(:dest_iti_headers, [
      stub_model(DestItiHeader,
        :dest_iti_name => "Dest Iti Name",
        :destination_id => 1,
        :day_number => 2
      ),
      stub_model(DestItiHeader,
        :dest_iti_name => "Dest Iti Name",
        :destination_id => 1,
        :day_number => 2
      )
    ])
  end
end
