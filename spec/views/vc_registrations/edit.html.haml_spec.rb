require 'spec_helper'

describe "vc_registrations/edit" do
  before(:each) do
    @vc_registration = assign(:vc_registration, stub_model(VcRegistration,
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :preferred_neighborhood => "MyString",
      :planning => false,
      :booking => false,
      :preferred_locations => "MyString",
      :lphone => "MyString",
      :mphone => "MyString",
      :email => "MyString",
      :comments => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit vc_registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vc_registration_path(@vc_registration), "post" do
      assert_select "input#vc_registration_name[name=?]", "vc_registration[name]"
      assert_select "input#vc_registration_address[name=?]", "vc_registration[address]"
      assert_select "input#vc_registration_city[name=?]", "vc_registration[city]"
      assert_select "input#vc_registration_state[name=?]", "vc_registration[state]"
      assert_select "input#vc_registration_preferred_neighborhood[name=?]", "vc_registration[preferred_neighborhood]"
      assert_select "input#vc_registration_planning[name=?]", "vc_registration[planning]"
      assert_select "input#vc_registration_booking[name=?]", "vc_registration[booking]"
      assert_select "input#vc_registration_preferred_locations[name=?]", "vc_registration[preferred_locations]"
      assert_select "input#vc_registration_lphone[name=?]", "vc_registration[lphone]"
      assert_select "input#vc_registration_mphone[name=?]", "vc_registration[mphone]"
      assert_select "input#vc_registration_email[name=?]", "vc_registration[email]"
      assert_select "input#vc_registration_comments[name=?]", "vc_registration[comments]"
      assert_select "input#vc_registration_country[name=?]", "vc_registration[country]"
    end
  end
end
