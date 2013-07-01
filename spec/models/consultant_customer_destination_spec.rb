require 'spec_helper'

describe ConsultantCustomerDestination do
  context "associations" do
    it { should belong_to :customer }
    it { should belong_to :vacation_consultant }
    it { should belong_to :cust_iti_header }
  end

  context "validation" do
    context "presense" do
      subject { FactoryGirl.create(:consultant_customer_destination) }
      it { should validate_presence_of :vacation_consultant_id }
      it { should validate_presence_of :customer_id }
      it { should validate_presence_of :cust_iti_header_id }
    end
  end
end
