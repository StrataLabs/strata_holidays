require 'spec_helper'

describe SearchController do

  describe "GET 'custom_search'" do
    it "returns http success" do
      get 'custom_search'
      response.should be_success
    end
  end

end
