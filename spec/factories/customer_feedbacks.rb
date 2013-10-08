# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer_feedback do
    cust_iti_detail_id 1
    positive_comments "MyText"
    negative_comments "MyText"
    suggestions "MyText"
  end
end
