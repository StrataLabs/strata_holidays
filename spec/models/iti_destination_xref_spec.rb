require 'spec_helper'

describe ItiDestinationXref do
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:iti_destination_xref) }
      it { should validate_presence_of :iti_header_id  }
      it { should validate_presence_of :destination_id }
      it { should validate_presence_of :destination_group_id }
      it { should validate_presence_of :dest_start_date }
      it { should validate_presence_of :dest_end_date }
      it { should validate_presence_of :season }
      it { should validate_presence_of :duration }
      it { should validate_presence_of :no_of_people }
    end
    context "association" do
      it { should belong_to :destination }
      it { should belong_to :iti_header }
    end
  end
end
