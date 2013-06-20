require 'spec_helper'

describe ItiHeader do
  context "validation" do
    context "association" do
      it {should belong_to :vacation_type}
    end
    context "presense" do
      subject { FactoryGirl.create(:iti_header) }
      it { should validate_presence_of :name }
      it { should validate_presence_of :iti_type }
      it { should validate_presence_of :vacation_type_id }
      it { should validate_presence_of :iti_start_date }
      it { should validate_presence_of :iti_end_date }
      it { should validate_presence_of :season }
      it { should validate_presence_of :duration }
      it { should validate_presence_of :no_of_people }
    end
    it "should validate length" do
      @poa = FactoryGirl.build(:iti_header,:name => "fo")
      @poa.should_not be_valid
      @poa = FactoryGirl.build(:iti_header,:name => "foodoo")
      @poa.should be_valid
      @poa = FactoryGirl.build(:iti_header,:name => "fo"*100)
      @poa.should_not be_valid
    end
    it "should validate end date" do
      iti_header = FactoryGirl.build(:iti_header, :iti_start_date => Time.zone.today, :iti_end_date => Time.zone.today - 1.month)
      iti_header.should_not be_valid
      iti_header.should have(1).errors_on(:iti_end_date)
      iti_header.errors_on(:iti_end_date).should include("cannot be past start date")
    end
  end
  it "create iti details after creating iti header" do
    iti_header = FactoryGirl.create(:iti_header, :iti_start_date => Time.zone.today + 10.days, :iti_end_date => Time.zone.today + 20.days)
    iti_details = ItiDetail.where(:iti_header_id => iti_header.id)
    iti_details.count.should == 10
    iti_details.first.iti_date.should == iti_header.iti_start_date
    iti_details.first.day_number.should == 1
    iti_details.last.iti_date.should == iti_header.iti_start_date + 9.days
  end
end
