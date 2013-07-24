require 'spec_helper'

describe "CustItiHeaders" do
  describe "GET /cust_iti_headers" do
    it "works! (now write some real specs)" do
      sign_in_as_a_valid_user
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cust_iti_headers_path
      response.status.should be(200)
    end
  end
end
