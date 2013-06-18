require 'spec_helper'

describe "properties/edit" do
  before(:each) do
    @property = assign(:property, stub_model(Property,
      :destination_id => 1,
      :name => "MyString",
      :type => "",
      :official_rating => "MyString",
      :customer_rating => "MyString",
      :restaurent => false,
      :pool => false,
      :funzoze => false,
      :comments => "MyString"
    ))
  end

  it "renders the edit property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", property_path(@property), "post" do
      assert_select "input#property_destination_id[name=?]", "property[destination_id]"
      assert_select "input#property_name[name=?]", "property[name]"
      assert_select "input#property_type[name=?]", "property[type]"
      assert_select "input#property_official_rating[name=?]", "property[official_rating]"
      assert_select "input#property_customer_rating[name=?]", "property[customer_rating]"
      assert_select "input#property_restaurent[name=?]", "property[restaurent]"
      assert_select "input#property_pool[name=?]", "property[pool]"
      assert_select "input#property_funzoze[name=?]", "property[funzoze]"
      assert_select "input#property_comments[name=?]", "property[comments]"
    end
  end
end
