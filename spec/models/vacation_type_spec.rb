require 'spec_helper'

describe VacationType do
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:vacation_type) }
      it { should validate_presence_of :vac_type  }
    end
    it "should validate length" do
      @dest = VacationType.new(:vac_type => "fo")
      @dest.should_not be_valid
      @dest = VacationType.new(:vac_type => "foodoo")
      @dest.should be_valid
      @dest = VacationType.new(:vac_type => "foodoo"*100)
      @dest.should_not be_valid
    end
  end
end
