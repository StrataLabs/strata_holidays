require 'spec_helper'

describe "vacation_types/new" do
  before(:each) do
    assign(:vacation_type, stub_model(VacationType,
      :vac_type => "MyString"
    ).as_new_record)
  end

  it "renders new vacation_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vacation_types_path, "post" do
      assert_select "input#vacation_type_vac_type[name=?]", "vacation_type[vac_type]"
    end
  end
end
