require 'spec_helper'

describe "iti_headers/index" do
  before(:each) do
    assign(:iti_headers, [
      stub_model(ItiHeader,
        :name => "Name",
        :iti_type => "Iti Type",
        :vacation_type_id => 1,
        :season => "Season",
        :duration => 2,
        :no_of_people => 3
      ),
      stub_model(ItiHeader,
        :name => "Name",
        :iti_type => "Iti Type",
        :vacation_type_id => 1,
        :season => "Season",
        :duration => 2,
        :no_of_people => 3
      )
    ])
  end
end
