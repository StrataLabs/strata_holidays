require 'spec_helper'

describe "wish_list_items/index" do
  before(:each) do
    assign(:wish_list_items, [
      stub_model(WishListItem),
      stub_model(WishListItem)
    ])
  end

  it "renders a list of wish_list_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
