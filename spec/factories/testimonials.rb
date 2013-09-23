# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :testimonial do
    vacation_consultant_id 1
    content "MyText"
    customer_id 1
  end
end
