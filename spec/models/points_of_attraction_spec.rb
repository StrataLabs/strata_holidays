require 'spec_helper'

describe PointsOfAttraction do
  context "associations" do
    it { should belong_to :destination }
  end
  context "validation" do
    context "presense" do
      subject { FactoryGirl.create(:destination) }
      it { should validate_presence_of :name }
    end
    it "should validate length" do
      @dest = Destination.new(:name => "fo")
      @dest.should_not be_valid
      @dest = Destination.new(:name => "foodoo")
      @dest.should be_valid
      @dest = Destination.new(:name => "foodoo"*100)
      @dest.should_not be_valid
    end
  end
end

