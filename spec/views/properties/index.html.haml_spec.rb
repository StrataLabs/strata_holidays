require 'spec_helper'

describe "properties/index" do
  before(:each) do
    assign(:properties, [
      stub_model(Property,
        :destination_id => 1,
        :name => "Name",
        :type => "Type",
        :official_rating => "Official Rating",
        :customer_rating => "Customer Rating",
        :restaurent => false,
        :pool => false,
        :funzoze => false,
        :comments => "Comments"
      ),
      stub_model(Property,
        :destination_id => 1,
        :name => "Name",
        :type => "Type",
        :official_rating => "Official Rating",
        :customer_rating => "Customer Rating",
        :restaurent => false,
        :pool => false,
        :funzoze => false,
        :comments => "Comments"
      )
    ])
  end

  it "renders a list of properties" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Official Rating".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Rating".to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end
