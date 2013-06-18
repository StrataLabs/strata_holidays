require 'spec_helper'

describe "Destinations" do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.build(:user)
    user.save!
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in user
  end
  describe "GET /destinations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get destinations_path
      response.status.should be(302)
    end
  end
end
