require 'spec_helper'

describe Account::CustItiRequest do
  context "associations" do
    it { should have_many :vc_assignments }
    it { should belong_to :customer }
  end
  context "validation" do
    context "presense" do
      subject { FactoryGirl.create(:cust_iti_request) }
      all_coulmns = ["customer_id", "dest_type", "destinations", "vacation_type_id", "start_date", "end_date", "no_of_adults"]
      all_coulmns.each do |column|
        it { should validate_presence_of column }
      end
    end
  end
end
