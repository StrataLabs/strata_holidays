require 'spec_helper'

describe "poa_types/edit" do
  before(:each) do
    @poa_type = assign(:poa_type, stub_model(PoaType,
      :poa_type => "MyString",
      :description => "MyString",
      :time_can_be_spent => "MyString",
      :comments => "MyString"
    ))
  end

  it "renders the edit poa_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", poa_type_path(@poa_type), "post" do
      assert_select "input#poa_type_poa_type[name=?]", "poa_type[poa_type]"
      assert_select "input#poa_type_description[name=?]", "poa_type[description]"
      assert_select "input#poa_type_time_can_be_spent[name=?]", "poa_type[time_can_be_spent]"
      assert_select "input#poa_type_comments[name=?]", "poa_type[comments]"
    end
  end
end
