require 'spec_helper'

describe "vacation_types/edit" do
  before(:each) do
    @vacation_type = assign(:vacation_type, stub_model(VacationType,
      :vac_type => "MyString"
    ))
  end

  it "renders the edit vacation_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vacation_type_path(@vacation_type), "post" do
      assert_select "input#vacation_type_vac_type[name=?]", "vacation_type[vac_type]"
    end
  end
end
