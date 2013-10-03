require 'spec_helper'

describe PointsOfAttraction do
  context "associations" do
    it { should belong_to :destination }
  end
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:points_of_attraction) }
      it { should validate_presence_of :name }
      it { should validate_presence_of :destination_id }
      it { should validate_presence_of :poa_type_id }
    end
    it "should validate length" do
      @poa = FactoryGirl.build(:points_of_attraction,:name => "fo")
      @poa.should_not be_valid
      @poa = FactoryGirl.build(:points_of_attraction,:name => "foodoo")
      @poa.should be_valid
      @poa = FactoryGirl.build(:points_of_attraction,:name => "fo"*100)
      @poa.should_not be_valid
    end
  end
end

