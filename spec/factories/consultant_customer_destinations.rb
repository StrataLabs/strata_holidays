# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :consultant_customer_destination do
    vacation_consultant_id 1
    customer_id 1
    cust_iti_header_id 1
  end
end
