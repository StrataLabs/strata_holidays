require 'spec_helper'

describe Account::VacationConsultant do
  context "associations" do
    it { should have_many :vc_assignments }
    it { should have_many :consultant_customer_destinations}
  end
  context "validation" do
    context "presense" do
      subject { FactoryGirl.create(:vacation_consultant) }
      all_coulmns = ["name", "address_1", "city", "state", "country", "mphone", "email", "preferred_neighborhood", "preferred_locations"]
      all_coulmns.each do |column|
        it { should validate_presence_of column }
      end
    end

    context "validation" do
      it "should validate mobile number" do
        vc = FactoryGirl.build(:vacation_consultant, :mphone => "12345")
        vc.should_not be_valid
        vc.should have(1).errors_on(:mphone)
      end
    end
  end
end
