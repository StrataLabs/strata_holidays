require 'spec_helper'

describe "user_responses/new" do
  before(:each) do
    assign(:user_response, stub_model(UserResponse).as_new_record)
  end

  it "renders new user_response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_responses_path, "post" do
    end
  end
end
