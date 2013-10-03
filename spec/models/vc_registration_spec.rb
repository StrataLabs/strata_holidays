require 'spec_helper'

describe VcRegistration do
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:vc_registration) }
      all_coulmns = ["name", "address_1", "city", "state", "country", "mphone", "email", "preferred_neighborhood", "preferred_locations", "status"]
      all_coulmns.each do |column|
        it { should validate_presence_of column }
      end
    end

    context "validation" do
      it "should validate mobile number" do
        vc = FactoryGirl.build(:vc_registration, :mphone => "12345")
        vc.should_not be_valid
        vc.should have(1).errors_on(:mphone)
      end
    end
  end
end