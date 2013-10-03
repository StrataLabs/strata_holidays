require 'spec_helper'

describe DestItiDetail do
  context "associations" do
    it { should belong_to :dest_iti_header }
    it { should belong_to :points_of_attraction }
  end
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:dest_iti_detail) }
      it { should validate_presence_of :dest_iti_header_id }
      it { should validate_presence_of :points_of_attraction_id }
    end
  end
end
