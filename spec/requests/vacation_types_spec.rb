require 'spec_helper'

describe "VacationTypes" do
  describe "GET /vacation_types" do
    it "works! (now write some real specs)" do
      sign_in_as_a_valid_user
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vacation_types_path
      response.status.should be(200)
    end
  end
end
