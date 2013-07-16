require 'spec_helper'

describe VacationConsultant do
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

    context "build from vc registrations" do
      it "should build vc from vc_registration data" do
        vc_reg = FactoryGirl.create(:vc_registration)
        vc = VacationConsultant.build_from_vc_reg(vc_reg)
        vc.name.should == vc_reg.name
        vc.mphone.should == vc_reg.mphone
      end
    end
  end
end