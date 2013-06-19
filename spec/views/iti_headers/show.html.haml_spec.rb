require 'spec_helper'

describe "iti_headers/show" do
  before(:each) do
    @iti_header = assign(:iti_header, stub_model(ItiHeader,
      :name => "Name",
      :iti_type => "Iti Type",
      :vacation_type_id => 1,
      :season => "Season",
      :duration => 2,
      :no_of_people => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Iti Type/)
    rendered.should match(/1/)
    rendered.should match(/Season/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
