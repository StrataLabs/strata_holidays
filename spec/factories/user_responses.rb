# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_response do
    name "MyString"
    email "MyString"
    contact_no "MyString"
    start_date "2013-10-24"
    end_date "2013-10-24"
    no_of_adults 1
    no_of_children 1
  end
end
