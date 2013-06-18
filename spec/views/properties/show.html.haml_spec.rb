require 'spec_helper'

describe "properties/show" do
  before(:each) do
    @property = assign(:property, stub_model(Property,
      :destination_id => 1,
      :name => "Name",
      :property_type => "Property Type",
      :official_rating => "Official Rating",
      :customer_rating => "Customer Rating",
      :restaurant => false,
      :pool => false,
      :fun_zone => false,
      :comments => "Comments"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Property Type/)
    rendered.should match(/Official Rating/)
    rendered.should match(/Customer Rating/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Comments/)
  end
end
