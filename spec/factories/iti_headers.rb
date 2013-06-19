# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :iti_header do
    name "MyString"
    iti_type "MyString"
    vacation_type_id 1
    iti_start_date "2013-06-19"
    iti_end_date "2013-06-19"
    season "MyString"
    duration 1
    no_of_people 1
  end
end
