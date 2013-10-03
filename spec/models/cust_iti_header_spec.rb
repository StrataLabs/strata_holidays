require 'spec_helper'

describe CustItiHeader do
  context "associations" do
    it { should belong_to :vacation_type }
    it { should have_many :cust_iti_details }
  end
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:cust_iti_header) }
      all_coulmns = CustItiHeader.column_names - ["id"] - ["created_at"] - ["updated_at"]
      all_coulmns.each do |column|
        it { should validate_presence_of column }
      end
    end
  end
end
