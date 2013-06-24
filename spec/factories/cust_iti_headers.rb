# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cust_iti_header do
    cust_iti_name "MyString"
    iti_type "MyString"
    vacation_type_id 1
    trip_start_date "2013-06-24"
    trip_end_date "2013-06-24"
    seasons "MyString"
    duration 1
    no_of_adults 1
    no_of_children "MyString"
  end
end
