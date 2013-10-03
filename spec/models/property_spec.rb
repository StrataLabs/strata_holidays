require 'spec_helper'

describe Property do
  context "validation" do
    context "association" do
      it {should belong_to :destination}
    end
    context "presence" do
      subject { FactoryGirl.create(:property) }
      it { should validate_presence_of :destination_id }
      it { should validate_presence_of :name }
      it { should validate_presence_of :property_type }
      it { should validate_presence_of :official_rating }
      it { should validate_presence_of :customer_rating }
    end
    it "should validate length" do
      @poa = FactoryGirl.build(:property,:name => "fo")
      @poa.should_not be_valid
      @poa = FactoryGirl.build(:property,:name => "foodoo")
      @poa.should be_valid
      @poa = FactoryGirl.build(:property,:name => "fo"*100)
      @poa.should_not be_valid
    end
  end
end
