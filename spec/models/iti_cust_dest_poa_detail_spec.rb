require 'spec_helper'

describe ItiCustDestPoaDetail do
  context "associations" do
    it { should belong_to :cust_iti_detail }
    it { should belong_to :dest_iti_detail }
    it { should belong_to :points_of_attraction }
  end
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:iti_cust_dest_poa_detail) }
      all_columns = ItiCustDestPoaDetail.column_names - ["id"] - ["created_at"] - ["updated_at"] - ["comments"]
      all_columns.each do |column|
        it { should validate_presence_of column }
      end
    end
  end
end
