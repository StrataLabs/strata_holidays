require 'spec_helper'

describe Customer do
  context "associations" do
    it { should belong_to :user }
    it { should have_many :cust_iti_headers }
  end

  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:customer) }
      it { should validate_presence_of :user_id }
      it { should validate_uniqueness_of :user_id }
    end
  end
end