require 'spec_helper'

describe "iti_headers/new" do
  before(:each) do
    assign(:iti_header, stub_model(ItiHeader,
      :name => "MyString",
      :iti_type => "MyString",
      :vacation_type_id => 1,
      :season => "MyString",
      :duration => 1,
      :no_of_people => 1
    ).as_new_record)
  end
end
