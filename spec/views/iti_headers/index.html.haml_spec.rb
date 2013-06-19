require 'spec_helper'

describe "iti_headers/index" do
  before(:each) do
    assign(:iti_headers, [
      stub_model(ItiHeader,
        :name => "Name",
        :iti_type => "Iti Type",
        :vacation_type_id => 1,
        :season => "Season",
        :duration => 2,
        :no_of_people => 3
      ),
      stub_model(ItiHeader,
        :name => "Name",
        :iti_type => "Iti Type",
        :vacation_type_id => 1,
        :season => "Season",
        :duration => 2,
        :no_of_people => 3
      )
    ])
  end

  it "renders a list of iti_headers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Iti Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Season".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
