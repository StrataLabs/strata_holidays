require 'spec_helper'

describe PoaType do
  context "validation" do
    context "presense" do
      subject { FactoryGirl.create(:poa_type) }
      it { should validate_presence_of :poa_type }
      it { should validate_presence_of :time_can_be_spent }
    end
    it "should validate length" do
      @poa = FactoryGirl.build(:poa_type,:poa_type => "fo")
      @poa.should_not be_valid
      @poa = FactoryGirl.build(:poa_type,:poa_type => "foodoo")
      @poa.should be_valid
      @poa = FactoryGirl.build(:poa_type,:poa_type => "fo"*100)
      @poa.should_not be_valid
    end
  end
end
