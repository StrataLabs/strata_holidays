require 'spec_helper'

describe "poa_types/show" do
  before(:each) do
    @poa_type = assign(:poa_type, stub_model(PoaType,
      :poa_type => "Poa Type",
      :description => "Description",
      :time_can_be_spent => "Time Can Be Spent",
      :comments => "Comments"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Poa Type/)
    rendered.should match(/Time Can Be Spent/)
    rendered.should match(/Comments/)
  end
end
