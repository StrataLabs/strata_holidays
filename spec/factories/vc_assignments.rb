# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vc_assignment do
    vacation_consultant_id 1
    cust_iti_request_id 1
    status "MyString"
  end
end
