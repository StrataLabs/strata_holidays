require 'spec_helper'

describe "vacation_consultants/index" do
  before(:each) do
    assign(:vacation_consultants, [
      stub_model(VacationConsultant,
        :name => "Name",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :state => "State",
        :country => "Country",
        :lphone => "Lphone",
        :mphone => "Mphone",
        :email => "Email",
        :comments => "Comments"
      ),
      stub_model(VacationConsultant,
        :name => "Name",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :state => "State",
        :country => "Country",
        :lphone => "Lphone",
        :mphone => "Mphone",
        :email => "Email",
        :comments => "Comments"
      )
    ])
  end

  it "renders a list of vacation_consultants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address 2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Lphone".to_s, :count => 2
    assert_select "tr>td", :text => "Mphone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end
