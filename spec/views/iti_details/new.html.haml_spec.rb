require 'spec_helper'

describe "iti_details/new" do
  before(:each) do
    assign(:iti_detail, stub_model(ItiDetail,
      :iti_header_id => 1,
      :destination_id => 1,
      :day_number => 1,
      :property_id => 1
    ).as_new_record)
  end
end
