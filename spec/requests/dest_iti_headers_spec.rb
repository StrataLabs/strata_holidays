require 'spec_helper'

describe "DestItiHeaders" do
  describe "GET /dest_iti_headers" do
    it "works! (now write some real specs)" do
      sign_in_as_a_valid_user
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get dest_iti_headers_path
      response.status.should be(200)
    end
  end
end
