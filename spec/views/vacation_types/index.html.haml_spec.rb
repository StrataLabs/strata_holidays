require 'spec_helper'

describe "vacation_types/index" do
  before(:each) do
    assign(:vacation_types, [
      stub_model(VacationType,
        :vac_type => "Vac Type"
      ),
      stub_model(VacationType,
        :vac_type => "Vac Type"
      )
    ])
  end

  it "renders a list of vacation_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vac Type".to_s, :count => 2
  end
end
