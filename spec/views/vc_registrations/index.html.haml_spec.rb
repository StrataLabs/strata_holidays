require 'spec_helper'

describe "vc_registrations/index" do
  before(:each) do
    assign(:vc_registrations, [
      stub_model(VcRegistration,
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :preferred_neighborhood => "Preferred Neighborhood",
        :planning => false,
        :booking => false,
        :preferred_locations => "Preferred Locations",
        :lphone => "Lphone",
        :mphone => "Mphone",
        :email => "Email",
        :comments => "Comments",
        :country => "Country"
      ),
      stub_model(VcRegistration,
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :preferred_neighborhood => "Preferred Neighborhood",
        :planning => false,
        :booking => false,
        :preferred_locations => "Preferred Locations",
        :lphone => "Lphone",
        :mphone => "Mphone",
        :email => "Email",
        :comments => "Comments",
        :country => "Country"
      )
    ])
  end

  it "renders a list of vc_registrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Preferred Neighborhood".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Preferred Locations".to_s, :count => 2
    assert_select "tr>td", :text => "Lphone".to_s, :count => 2
    assert_select "tr>td", :text => "Mphone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
