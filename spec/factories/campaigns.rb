# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    header "MyString"
    footer "MyString"
    image ""
    body "MyText"
    vacation_consultant_id 1
    start_date "2013-10-30"
    end_date "2013-10-30"
  end
end
