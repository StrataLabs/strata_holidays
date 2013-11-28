require 'spec_helper'

describe "user_responses/index" do
  before(:each) do
    assign(:user_responses, [
      stub_model(UserResponse),
      stub_model(UserResponse)
    ])
  end

  it "renders a list of user_responses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
