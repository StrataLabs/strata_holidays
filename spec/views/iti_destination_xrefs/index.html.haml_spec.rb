require 'spec_helper'

describe "iti_destination_xrefs/index" do
  before(:each) do
    assign(:iti_destination_xrefs, [
      stub_model(ItiDestinationXref,
        :iti_header_id => 1,
        :destination_id => 2,
        :destination_group_id => 3,
        :season => "Season",
        :duration => 4,
        :no_of_people => 5
      ),
      stub_model(ItiDestinationXref,
        :iti_header_id => 1,
        :destination_id => 2,
        :destination_group_id => 3,
        :season => "Season",
        :duration => 4,
        :no_of_people => 5
      )
    ])
  end
end
