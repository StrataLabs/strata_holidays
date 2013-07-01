require 'spec_helper'

describe "vacation_consultants/edit" do
  before(:each) do
    @vacation_consultant = assign(:vacation_consultant, stub_model(VacationConsultant,
      :name => "MyString",
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :lphone => "MyString",
      :mphone => "MyString",
      :email => "MyString",
      :comments => "MyString"
    ))
  end

  it "renders the edit vacation_consultant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vacation_consultant_path(@vacation_consultant), "post" do
      assert_select "input#vacation_consultant_name[name=?]", "vacation_consultant[name]"
      assert_select "input#vacation_consultant_address_1[name=?]", "vacation_consultant[address_1]"
      assert_select "input#vacation_consultant_address_2[name=?]", "vacation_consultant[address_2]"
      assert_select "input#vacation_consultant_city[name=?]", "vacation_consultant[city]"
      assert_select "input#vacation_consultant_state[name=?]", "vacation_consultant[state]"
      assert_select "input#vacation_consultant_country[name=?]", "vacation_consultant[country]"
      assert_select "input#vacation_consultant_lphone[name=?]", "vacation_consultant[lphone]"
      assert_select "input#vacation_consultant_mphone[name=?]", "vacation_consultant[mphone]"
      assert_select "input#vacation_consultant_email[name=?]", "vacation_consultant[email]"
      assert_select "input#vacation_consultant_comments[name=?]", "vacation_consultant[comments]"
    end
  end
end
