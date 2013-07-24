require 'spec_helper'

describe "ConsultantCustomerDestinations" do
  describe "GET /consultant_customer_destinations" do
    it "works! (now write some real specs)" do
      sign_in_as_a_valid_user
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get consultant_customer_destinations_path
      response.status.should be(200)
    end
  end
end
