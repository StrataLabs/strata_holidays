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

  it "renders new iti_destination_xref form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", iti_destination_xrefs_path, "post" do
      assert_select "input#iti_destination_xref_iti_header_id[name=?]", "iti_destination_xref[iti_header_id]"
      assert_select "input#iti_destination_xref_destination_id[name=?]", "iti_destination_xref[destination_id]"
      assert_select "input#iti_destination_xref_destination_group_id[name=?]", "iti_destination_xref[destination_group_id]"
      assert_select "input#iti_destination_xref_season[name=?]", "iti_destination_xref[season]"
      assert_select "input#iti_destination_xref_duration[name=?]", "iti_destination_xref[duration]"
      assert_select "input#iti_destination_xref_no_of_people[name=?]", "iti_destination_xref[no_of_people]"
    end
  end
end
