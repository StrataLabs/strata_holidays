require 'spec_helper'

describe CustItiDetail do
  context "associations" do
    it { should belong_to :cust_iti_header }
    it { should belong_to :property }
    it { should belong_to :destination }
    it { should have_many :iti_cust_dest_poa_details }
  end
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:cust_iti_detail) }
      all_coulmns = CustItiDetail.column_names - ["id"] - ["created_at"] - ["updated_at"]
      all_coulmns.each do |column|
        it { should validate_presence_of column }
      end
    end
  end
end
