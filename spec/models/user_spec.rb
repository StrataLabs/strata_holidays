require 'spec_helper'

describe User do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_one(:customer) }
  it { should have_one(:vacation_consultant) }

  context "with a new user" do
    let(:user) { FactoryGirl.build(:user) }
    it "accepts email example@unwinders.com" do
      user.email = "example@unwinders.com"
      user.save
      user.should be_valid
    end
    it "does not accept email unwinders.com" do
      user.email = "unwinders.com"
      user.save
      user.should_not be_valid
    end
    it "does not accept blank name" do
      user.name = ""
      user.save
      user.errors[:name].should include("Name cannot be blank")
    end
    it "builds customer record if user_type is not present" do
      user = FactoryGirl.build(:user,:name => "foo", :user_type => nil)
      user.save
      user.customer.should be_valid
    end
  end
end