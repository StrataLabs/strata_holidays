require 'spec_helper'

describe "points_of_attractions/edit" do
  before(:each) do
    @points_of_attraction = assign(:points_of_attraction, stub_model(PointsOfAttraction,
      :destination_id => 1,
      :poa_type_id => 1,
      :name => "MyString",
      :comments => "MyString"
    ))
  end

  it "renders the edit points_of_attraction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", points_of_attraction_path(@points_of_attraction), "post" do
      assert_select "input#points_of_attraction_destination_id[name=?]", "points_of_attraction[destination_id]"
      assert_select "input#points_of_attraction_poa_type_id[name=?]", "points_of_attraction[poa_type_id]"
      assert_select "input#points_of_attraction_name[name=?]", "points_of_attraction[name]"
      assert_select "input#points_of_attraction_comments[name=?]", "points_of_attraction[comments]"
    end
  end
end
