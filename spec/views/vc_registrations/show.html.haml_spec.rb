require 'spec_helper'

describe "vc_registrations/show" do
  before(:each) do
    @vc_registration = assign(:vc_registration, stub_model(VcRegistration,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Preferred Neighborhood/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Preferred Locations/)
    rendered.should match(/Lphone/)
    rendered.should match(/Mphone/)
    rendered.should match(/Email/)
    rendered.should match(/Comments/)
    rendered.should match(/Country/)
  end
end
