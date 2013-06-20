require 'spec_helper'

describe "poa_types/new" do
  before(:each) do
    assign(:poa_type, stub_model(PoaType,
      :poa_type => "MyString",
      :description => "MyString",
      :time_can_be_spent => "MyString",
      :comments => "MyString"
    ).as_new_record)
  end

  it "renders new poa_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", poa_types_path, "post" do
      assert_select "input#poa_type_poa_type[name=?]", "poa_type[poa_type]"
      assert_select "input#poa_type_time_can_be_spent[name=?]", "poa_type[time_can_be_spent]"
      assert_select "input#poa_type_comments[name=?]", "poa_type[comments]"
    end
  end
end
