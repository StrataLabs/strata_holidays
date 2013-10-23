require 'spec_helper'

describe "wish_list_items/show" do
  before(:each) do
    @wish_list_item = assign(:wish_list_item, stub_model(WishListItem))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
