require 'spec_helper'

describe "properties/new" do
  before(:each) do
    assign(:property, stub_model(Property,
      :destination_id => 1,
      :name => "MyString",
      :property_type => "MyString",
      :official_rating => "MyString",
      :customer_rating => "MyString",
      :restaurant => false,
      :pool => false,
      :fun_zone => false,
      :comments => "MyString"
    ).as_new_record)
  end  
end
