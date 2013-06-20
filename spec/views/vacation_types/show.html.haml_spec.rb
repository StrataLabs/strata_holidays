require 'spec_helper'

describe "vacation_types/show" do
  before(:each) do
    @vacation_type = assign(:vacation_type, stub_model(VacationType,
      :vac_type => "Vac Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vac Type/)
  end
end
