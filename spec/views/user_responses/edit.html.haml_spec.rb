require 'spec_helper'

describe "user_responses/edit" do
  before(:each) do
    @user_response = assign(:user_response, stub_model(UserResponse))
  end

  it "renders the edit user_response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_response_path(@user_response), "post" do
    end
  end
end
