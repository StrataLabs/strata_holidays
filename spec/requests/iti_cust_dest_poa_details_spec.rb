require 'spec_helper'

describe "ItiCustDestPoaDetails" do
  describe "GET /iti_cust_dest_poa_details" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get iti_cust_dest_poa_details_path
      response.status.should be(200)
    end
  end
end