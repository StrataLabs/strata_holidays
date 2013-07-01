require 'spec_helper'

describe "vacation_consultants/show" do
  before(:each) do
    @vacation_consultant = assign(:vacation_consultant, stub_model(VacationConsultant,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address 1/)
    rendered.should match(/Address 2/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Country/)
    rendered.should match(/Lphone/)
    rendered.should match(/Mphone/)
    rendered.should match(/Email/)
    rendered.should match(/Comments/)
  end
end
