require 'spec_helper'

describe "user_responses/show" do
  before(:each) do
    @user_response = assign(:user_response, stub_model(UserResponse))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
