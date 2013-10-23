require 'spec_helper'

describe "wish_list_items/edit" do
  before(:each) do
    @wish_list_item = assign(:wish_list_item, stub_model(WishListItem))
  end

  it "renders the edit wish_list_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wish_list_item_path(@wish_list_item), "post" do
    end
  end
end
