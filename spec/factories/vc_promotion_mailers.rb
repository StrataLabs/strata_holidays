# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vc_promotion_mailer do
    subject "MyString"
    content "MyText"
    vacation_consultant_id 1
  end
end
