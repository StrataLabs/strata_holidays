require 'spec_helper'

describe "iti_destination_xrefs/new" do
  before(:each) do
    assign(:iti_destination_xref, stub_model(ItiDestinationXref,
      :iti_header_id => 1,
      :destination_id => 1,
      :destination_group_id => 1,
      :season => "MyString",
      :duration => 1,
      :no_of_people => 1
    ).as_new_record)
  end
end
