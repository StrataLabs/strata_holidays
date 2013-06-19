require 'spec_helper'

describe "iti_headers/new" do
  before(:each) do
    assign(:iti_header, stub_model(ItiHeader,
      :name => "MyString",
      :iti_type => "MyString",
      :vacation_type_id => 1,
      :season => "MyString",
      :duration => 1,
      :no_of_people => 1
    ).as_new_record)
  end

  it "renders new iti_header form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", iti_headers_path, "post" do
      assert_select "input#iti_header_name[name=?]", "iti_header[name]"
      assert_select "input#iti_header_iti_type[name=?]", "iti_header[iti_type]"
      assert_select "input#iti_header_vacation_type_id[name=?]", "iti_header[vacation_type_id]"
      assert_select "input#iti_header_season[name=?]", "iti_header[season]"
      assert_select "input#iti_header_duration[name=?]", "iti_header[duration]"
      assert_select "input#iti_header_no_of_people[name=?]", "iti_header[no_of_people]"
    end
  end
end
