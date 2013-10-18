require 'spec_helper'

describe StaticPagesController do
  login_user
  describe "GET 'itinerary'" do
    before(:each) do
      cust_iti_header = FactoryGirl.create(:cust_iti_header)
    end
    it "returns http success" do
      get 'itinerary'
      response.should be_success
    end
  end

end
