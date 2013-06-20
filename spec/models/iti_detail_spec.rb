require 'spec_helper'

describe ItiDetail do
  context "validation" do
    context "presense" do
      subject { FactoryGirl.create(:iti_detail) }
      it { should validate_presence_of :iti_header_id }
      it { should validate_presence_of :destination_id }
      it { should validate_presence_of :day_number }
      it { should validate_presence_of :property_id }
      it { should validate_presence_of :iti_date }
    end
    context "associations" do
      it { should belong_to :destination }
      it { should belong_to :iti_header }
      it { should belong_to :property }
    end
  end
end

