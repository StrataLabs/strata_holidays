require 'spec_helper'

describe "iti_destination_xrefs/show" do
  before(:each) do
    @iti_destination_xref = assign(:iti_destination_xref, stub_model(ItiDestinationXref,
      :iti_header_id => 1,
      :destination_id => 2,
      :destination_group_id => 3,
      :season => "Season",
      :duration => 4,
      :no_of_people => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Season/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
