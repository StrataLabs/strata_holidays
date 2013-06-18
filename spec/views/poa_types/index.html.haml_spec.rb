require 'spec_helper'

describe "poa_types/index" do
  before(:each) do
    assign(:poa_types, [
      stub_model(PoaType,
        :poa_type => "Poa Type",
        :description => "Description",
        :time_can_be_spent => "Time Can Be Spent",
        :comments => "Comments"
      ),
      stub_model(PoaType,
        :poa_type => "Poa Type",
        :description => "Description",
        :time_can_be_spent => "Time Can Be Spent",
        :comments => "Comments"
      )
    ])
  end

  it "renders a list of poa_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Poa Type".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Time Can Be Spent".to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end
