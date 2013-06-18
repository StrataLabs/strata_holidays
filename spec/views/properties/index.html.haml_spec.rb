require 'spec_helper'

describe "properties/index" do
  before(:each) do
    assign(:properties, [
      stub_model(Property,
        :destination_id => 1,
        :name => "Name",
        :property_type => "Property Type",
        :official_rating => "Official Rating",
        :customer_rating => "Customer Rating",
        :restaurant => false,
        :pool => false,
        :fun_zone => false,
        :comments => "Comments"
      ),
      stub_model(Property,
        :destination_id => 1,
        :name => "Name",
        :property_type => "Property Type",
        :official_rating => "Official Rating",
        :customer_rating => "Customer Rating",
        :restaurant => false,
        :pool => false,
        :fun_zone => false,
        :comments => "Comments"
      )
    ])
  end  
end
