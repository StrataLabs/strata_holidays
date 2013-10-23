require 'spec_helper'

describe "wish_list_items/new" do
  before(:each) do
    assign(:wish_list_item, stub_model(WishListItem).as_new_record)
  end

  it "renders new wish_list_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wish_list_items_path, "post" do
    end
  end
end
