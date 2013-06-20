require 'spec_helper'

describe ItiDayDetail do
  context "validation" do
    context "associations" do
      it { should belong_to :iti_header }
      it { should belong_to :points_of_attraction }
    end
    context "presense" do
      subject { FactoryGirl.create(:iti_day_detail) }
      it { should validate_presence_of :iti_header_id  }
      it { should validate_presence_of :day_number }
      it { should validate_presence_of :points_of_attraction_id }
      it { should validate_presence_of :start_time }
      it { should validate_presence_of :end_time }
    end
  end
end
