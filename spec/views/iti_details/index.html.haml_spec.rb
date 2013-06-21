require 'spec_helper'

describe "iti_details/index" do
  before(:each) do
    assign(:iti_details, [
      stub_model(ItiDetail,
        :iti_header_id => 1,
        :destination_id => 2,
        :day_number => 3,
        :property_id => 4
      ),
      stub_model(ItiDetail,
        :iti_header_id => 1,
        :destination_id => 2,
        :day_number => 3,
        :property_id => 4
      )
    ])
  end
end
