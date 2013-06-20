require 'spec_helper'

describe "iti_details/edit" do
  before(:each) do
    @iti_detail = assign(:iti_detail, stub_model(ItiDetail,
      :iti_header_id => 1,
      :destination_id => 1,
      :day_number => 1,
      :property_id => 1
    ))
  end
end
