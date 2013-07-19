require 'spec_helper'

describe Destination do
  context "associations" do
    it { should have_many :points_of_attractions }
  end

  context "validation" do
    context "presense" do
      subject { FactoryGirl.create(:destination) }
      it { should validate_presence_of :name }
      it { should validate_presence_of :description }
    end
    it "should validate length" do
      @dest = Destination.new(:name => "fo")
      @dest.should_not be_valid
      @dest = Destination.new(:name => "foodoo", :description => "something")
      @dest.should be_valid
      @dest = Destination.new(:name => "foodoo"*100)
      @dest.should_not be_valid
    end
  end
end