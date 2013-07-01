require 'spec_helper'

describe DestItiHeader do
  context "associations" do
    it { should belong_to :destination }
    it { should have_many :dest_iti_details }
  end
  context "validation" do
    context "presense" do
      subject { FactoryGirl.create(:dest_iti_header) }
      all_coulmns = DestItiHeader.column_names - ["id"] - ["created_at"] - ["updated_at"]
      all_coulmns.each do |column|
        it { should validate_presence_of column }
      end
    end
  end
end
