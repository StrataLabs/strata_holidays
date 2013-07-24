require 'spec_helper'

describe StaticPagesController do
  login_user
  describe "GET 'itinerary'" do
    it "returns http success" do
      get 'itinerary'
      response.should be_success
    end
  end

end
